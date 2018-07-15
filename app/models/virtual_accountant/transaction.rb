class VirtualAccountant::Transaction
  include Mongoid::Document
  include ActiveModel::Serializers::JSON
  store_in client: "accounting"

  attr_accessor :date

  field :transaction_date, type: Date
  field :description, type: String
  field :credit_amt, type: Float
  field :debit_amt, type: Float
  field :net_amt, type: Float
  field :type, type: String
  field :import_date, type: Date, default: Date.today

  belongs_to :category, class_name: "VirtualAccountant::Category", optional: true
  belongs_to :account, class_name: "VirtualAccountant::Account", optional: true
  # belongs_to :vendor, class_name: "VirtualAccountant::Vendor", optional: true

  validate :date_is_valid, on: :create

  validates :net_amt, presence: true
  validates :description, presence: true
  validates :type, presence: true

  def self.find_duplicates(transactions)
    search_query = self
    transaction_hashes = transactions.map { |t| { description: t.description, transaction_date: t.transaction_date, net_amt: t.net_amt }}
    dupes = self.where(:$or => transaction_hashes)
  end

  def self.find_for_graph(category, start_date=nil, end_date=nil)
    query = self.where(transaction_category: category)
    query = query.where(:transaction_date.gt => start_date) unless start_date.nil?
    query = query.where(:transaction_date.lt => end_date) unless end_date.nil?
    query
  end

  private
  def date_is_valid
    errors.add(:transaction_date, "Invalid date string") unless convert_transaction_date
  end

  def convert_transaction_date
    return false if self.date.nil?
    begin
      self.transaction_date = Date.parse(self.date)
    rescue ArgumentError
      false
    end
  end
end

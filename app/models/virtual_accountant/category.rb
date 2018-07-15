class VirtualAccountant::Category
  include Mongoid::Document
  store_in client: "accounting"

  attr_accessor :csv_row, :calculated_net
  attr_reader :balance

  field :name, type: String
  field :reported_credit, type: Float
  field :reported_debit, type: Float
  field :reported_net, type: Float
  field :transaction_type, type: String

  has_many :transactions, class_name: "VirtualAccountant::Transaction", autosave: true
  # has_many :vendors, class_name: "VirtualAccountant::Vendor"

  validate :transaction_type_is_valid, on: :create

  validates :reported_debit, presence: true
  validates :reported_credit, presence: true
  validates :reported_net, presence: true
  validates :transaction_type, presence: true

  def self.find_by_type(type, start_date=nil, end_date=nil)
    self.where(transaction_type: type).map do |category|
      found_transactions = category.transactions
      found_transactions = found_transactions.where(:transaction_date.gt => start_date) if start_date
      found_transactions = found_transactions.where(:transaction_date.lt => end_date) if end_date
      category.calculated_net = found_transactions ? self.sum_transactions(found_transactions) : 0
      category
    end
  end

  def self.sum_transactions(current_transactions)
    return current_transactions.reduce(0) { |sum, transaction| sum += transaction.net_amt }.round(2)
  end

  private
  def transaction_type_is_valid
    errors.add(:type, "Unable to parse transaction type") unless determine_transaction_type
  end

  def determine_transaction_type
    expenses = self.class.sum_transactions(self.transactions.select {|t| t.type == "expense"}).abs
    incomes = self.class.sum_transactions(self.transactions.select {|t| t.type == "income"}).abs
    if expenses == incomes
      self.transaction_type = :journal
    else
      self.transaction_type = expenses > incomes ? :expense : :income
    end
  end
end

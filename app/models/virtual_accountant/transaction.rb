class VirtualAccountant::Transaction
  include Mongoid::Document
  store_in collection: "transactions", database: "makerspace_accounting", client: "accounting"
  after_create :determine_transaction_type

  attr_accessor :date

  field :transaction_date, type: Date
  field :description, type: String
  field :credit_amt, type: Float
  field :debit_amt, type: Float
  field :type, type: String
  field :import_date, type: Date, default: Date.today

  # belongs_to :transaction_category, class_name: "VirtualAccountant::Category"
  # belongs_to :vendor, class_name: "VirtualAccountant::Vendor", optional: true

  validate :date_is_valid

  def self.row_to_transaction_hash(csv_row)
    date, description, credit, debit = csv_row
    { date: date, description: description, credit_amt: credit, debit_amt: debit}
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

  def determine_transaction_type
    if /^.+( to)/ === self.description
      self.type = :transfer_to
    elsif /^.+( from)/ === self.description
      self.type = :transfer_from
    else
      trans_type = self.description.split(" ").map { |p| p.strip }.compact.first
      throw "Invalid type #{self.description}" unless /(Expense|Income)/ === trans_type
      # Set object to expense or income
    end
  end
end
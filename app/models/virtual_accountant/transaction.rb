class VirtualAccountant::Transaction
  include Mongoid::Document
  store_in collection: "transactions", database: "makerspace_accounting", client: "accounting"

  attr_accessor :date

  field :transaction_date, type: Date
  field :description, type: String
  field :credit_amt, type: Float
  field :debit_amt, type: Float
  field :type, type: String
  field :import_date, type: Date, default: Date.today

  belongs_to :transaction_category, class_name: "VirtualAccountant::Category", optional: true
  # belongs_to :vendor, class_name: "VirtualAccountant::Vendor", optional: true

  validate :date_is_valid
  # validate :transaction_type_is_valid

  def self.row_to_transaction_hash(csv_row)
    date, description, credit, debit = csv_row
    { date: date, description: description, credit_amt: credit, debit_amt: debit}
  end

  private
  def date_is_valid
    errors.add(:transaction_date, "Invalid date string") unless convert_transaction_date
  end

  def transaction_type_is_valid
    errors.add(:type, "Unable to parse transaction type") unless determine_transaction_type
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
    transaction_string, * = self.description.split(" - ", 2) unless self.description.nil?
    return false if transaction_string.nil?

    transaction_string.strip!
    if /^.+( to)/ === transaction_string
      self.type = :transfer_to
    elsif /^.+( from)/ === transaction_string
      self.type = :transfer_from
    else
      trans_type = transaction_string.split(" ").map { |p| p.strip }.compact.first
      return false unless /(Expense|Income)/ === trans_type
      self.type = trans_type === "Expense" ? :expense : :income
    end
  end
end

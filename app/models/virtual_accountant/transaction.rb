class VirtualAccountant::Transaction
  include Mongoid::Document
  include ActiveModel::Serializers::JSON
  store_in collection: "transactions", database: "makerspace_accounting", client: "accounting"

  attr_accessor :date

  field :transaction_date, type: Date
  field :description, type: String
  field :credit_amt, type: Float
  field :debit_amt, type: Float
  field :net_amt, type: Float
  field :type, type: String
  field :import_date, type: Date, default: Date.today

  belongs_to :transaction_category, class_name: "VirtualAccountant::Category", optional: true
  # belongs_to :vendor, class_name: "VirtualAccountant::Vendor", optional: true

  validate :date_is_valid, on: :create
  validate :transaction_type_is_valid, on: :create

  validates :net_amt, presence: true
  validates :description, presence: true
  validates :type, presence: true

  def self.row_to_transaction_hash(csv_row)
    date, description, debit, credit = csv_row
    credit_amt = credit.gsub(",", "") unless credit.nil?
    debit_amt = debit.gsub(",", "") unless debit.nil?
    { date: date, description: description, credit_amt: credit_amt, debit_amt: debit_amt}
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
    calculate_net_amt
  end

  def calculate_net_amt
    type_found = true
    case self.type.to_sym
    when :expense
      self.net_amt = (self.debit_amt || 0) - (self.credit_amt || 0)
    when :income
      self.net_amt = (self.credit_amt || 0) - (self.debit_amt || 0)
    when :transfer_from
      self.net_amt = (self.debit_amt || 0) - (self.credit_amt || 0)
    when :transfer_to
      self.net_amt = (self.credit_amt || 0) -( self.debit_amt || 0)
    else
      type_found = false # Return validation error if not recognized type
    end
    type_found
  end
end

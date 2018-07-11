class VirtualAccountant::Category
  include Mongoid::Document
  include VirtualAccountant
  store_in collection: "categories", database: "makerspace_accounting", client: "accounting"

  attr_accessor :csv_row, :calculated_net
  attr_reader :balance

  field :name, type: String
  field :reported_credit, type: Float
  field :reported_debit, type: Float
  field :reported_net, type: Float
  field :transaction_type, type: String

  has_many :transactions, class_name: "VirtualAccountant::Transaction", autosave: true
  # has_many :vendors, class_name: "VirtualAccountant::Vendor"

  validates :reported_debit, presence: true
  validates :reported_credit, presence: true
  validates :reported_net, presence: true
  validates :transaction_type, presence: true

  BANK_ACCOUNNTS = [
    "Cash on Hand",
    "Paypal",
    "Bluebird",
    "Northway Bank",
    "In-Kind Current Asset Donation",
    "In-Kind Fixed Asset Donations",
    "Fixed Asset Purchase",
  ]

  def self.start_new_category?(record_description)
    record_description !~ /^(Net|Total)/
  end

  def self.end_current_category?(record_description)
    record_description == "Net Movement"
  end

  def self.find_by_type(type, start_date=nil, end_date=nil)
    self.where(transaction_type: type).not_in(name: BANK_ACCOUNNTS).map do |category|
      found_transactions = category.transactions
      found_transactions = found_transactions.where(:transaction_date.gt => start_date) if start_date
      found_transactions = found_transactions.where(:transaction_date.lt => end_date) if end_date
      category.calculated_net = found_transactions ? self.sum_transactions(found_transactions) : 0
      category
    end
  end

  def determine_transaction_type
    expenses = self.class.sum_transactions(self.transactions.select {|t| t.type == "expense"}).abs
    incomes = self.class.sum_transactions(self.transactions.select {|t| t.type == "income"}).abs
    expenses > incomes ? "expense" : "income"
  end

  def parse_total(csv_row)
    return unless csv_row.first =~ Regexp.new("^(Total #{self.name})")
    *, debit, credit = csv_row
    self.reported_debit = from_currency(debit)
    self.reported_credit = from_currency(credit)
  end

  def parse_net(csv_row)
    return if (defined?(csv_row.last)).nil?
    net_amt = csv_row.last
    if net_amt.gsub!(/^\(|\)$/, '')
      net_amt = -net_amt
    end
    return from_currency(net_amt)
  end

  def self.sum_transactions(current_transactions)
    return current_transactions.reduce(0) { |sum, transaction| sum += transaction.net_amt }.round(2)
  end
end

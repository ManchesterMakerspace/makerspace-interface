class VirtualAccountant::Category
  include Mongoid::Document
  include VirtualAccountant
  store_in collection: "categories", database: "makerspace_accounting", client: "accounting"

  attr_accessor :csv_row
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
    "Northway Bank"
  ]

  def self.start_new_category?(record_description)
    record_description !~ /^(Net|Total)/
  end

  def self.end_current_category?(record_description)
    record_description == "Net Movement"
  end

  def self.find_by_type(type)
    self.where(transaction_type: type).not_in(name: BANK_ACCOUNNTS)
  end

  def determine_transaction_type
    expenses = self.transactions.select {|t| t.type == "expense"}.count
    incomes = self.transactions.select {|t| t.type == "income"}.count
    expenses >= incomes ? "expense" : "income"
  end

  def parse_total(csv_row)
    return unless csv_row.first =~ Regexp.new("^(Total #{self.name})")
    *, debit, credit = csv_row
    self.reported_debit = from_currency(debit).round(2)
    self.reported_credit = from_currency(credit).round(2)
  end

  def parse_net(csv_row)
    return if (defined?(csv_row.last)).nil?
    net_amt = csv_row.last
    if net_amt.gsub!(/^\(|\)$/, '')
      net_amt = -net_amt
    end
    return net_amt
  end

  def balance
    return self.transactions.reduce(0) { |sum, transaction| sum += transaction.net_amt }.round(2)
  end
end

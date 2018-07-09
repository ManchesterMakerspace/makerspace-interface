class VirtualAccountant::Category
  include Mongoid::Document
  include VirtualAccountant
  store_in collection: "categories", database: "makerspace_accounting", client: "accounting"

  attr_accessor :csv_row

  field :name, type: String
  field :total_debit, type: Float
  field :total_credit, type: Float
  field :reported_net, type: Float
  field :transaction_type, type: String

  has_many :transactions, class_name: "VirtualAccountant::Transaction", autosave: true
  # has_many :vendors, class_name: "VirtualAccountant::Vendor"

  validates :total_debit, presence: true
  validates :total_credit, presence: true
  validates :reported_net, presence: true
  validates :transaction_type, presence: true

  def self.start_new_category?(record_description)
    record_description !~ /^(Net|Total)/
  end

  def self.end_current_category?(record_description)
    record_description == "Net Movement"
  end

  def determine_transaction_type
    expenses = self.transactions.select {|t| t.type == "expense"}.count
    incomes = self.transactions.select {|t| t.type == "income"}.count
    expenses >= incomes ? "expense" : "income"
  end

  def parse_total(csv_row)
    return unless csv_row.first =~ Regexp.new("^(Total #{self.name})")
    *, debit, credit = csv_row
    self.total_debit = from_currency(debit).round(2)
    self.total_credit = from_currency(credit).round(2)
  end

  def parse_net(csv_row)
    return if (defined?(csv_row.last)).nil?
    net_amt = csv_row.last
    if net_amt.gsub!(/^\(|\)$/, '')
      net_amt = -net_amt
    end
    return net_amt
  end
end

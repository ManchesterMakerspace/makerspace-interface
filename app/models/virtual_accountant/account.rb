class VirtualAccountant::Account
  include Mongoid::Document
  store_in client: "accounting"

  attr_accessor :calculated_net

  field :name, type: String
  field :reported_credit, type: Float
  field :reported_debit, type: Float
  field :reported_net, type: Float

  has_many :transactions, class_name: "VirtualAccountant::Transaction", autosave: true
  # has_many :vendors, class_name: "VirtualAccountant::Vendor"

  validates :name, presence: true
  validates :reported_debit, presence: true
  validates :reported_credit, presence: true
  validates :reported_net, presence: true

  @@BANK_ACCOUNNTS = [
    "Cash on Hand",
    "Paypal",
    "Bluebird",
    "Northway Bank",
    "In-Kind Current Asset Donation",
    "In-Kind Fixed Asset Donations",
    "Fixed Asset Purchase",
  ]

  def self.is_bank_account?(name)
    return @@BANK_ACCOUNNTS.include?(name)
  end


  def self.find_by_date(start_date=nil, end_date=nil)
    self.all.map do |account|
      found_transactions = account.transactions
      found_transactions = found_transactions.where(:transaction_date.gt => start_date) if start_date
      found_transactions = found_transactions.where(:transaction_date.lt => end_date) if end_date
      account.calculated_net = found_transactions ? self.sum_transactions(found_transactions) : 0
      account
    end
  end

  def self.sum_transactions(current_transactions)
    return current_transactions.reduce(0) { |sum, transaction| sum += transaction.net_amt }.round(2)
  end
end

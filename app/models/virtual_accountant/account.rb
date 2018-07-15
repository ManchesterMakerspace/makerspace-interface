class VirtualAccountant::Account
  include Mongoid::Document
  store_in client: "accounting"

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
end

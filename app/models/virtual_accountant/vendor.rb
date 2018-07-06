class VirtualAccountant::Vendor
  attr_accessor :name, :type, :transaction_regex

  # belongs_to :transaction_category, class_name: "VirtualAccountant::Category"
  # has_many :transactions, class_name: "VirtualAccountant::Transaction"

end
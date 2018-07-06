class VirtualAccountant::Category
  include Mongoid::Document
  store_in collection: "transactions", database: "makerspace_accounting", client: "accounting"

  field :name, type: String
  field :total, type: Float
  field :net, type: Float

  # has_many :transactions, class_name: "VirtualAccountant::Transaction"
  # has_many :vendors, class_name: "VirtualAccountant::Vendor"

end
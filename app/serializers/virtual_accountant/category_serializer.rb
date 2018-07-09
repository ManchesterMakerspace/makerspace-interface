class VirtualAccountant::CategorySerializer < ActiveModel::Serializer
  attributes :name, :total_debit, :total_credit, :reported_net, :transaction_type
  # has_many :transactions
end

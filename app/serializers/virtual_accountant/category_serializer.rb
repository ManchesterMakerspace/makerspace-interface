class VirtualAccountant::CategorySerializer < ActiveModel::Serializer
  attributes :name, :reported_debit, :reported_credit, :reported_net, :transaction_type, :calculated_net
  # has_many :transactions
end

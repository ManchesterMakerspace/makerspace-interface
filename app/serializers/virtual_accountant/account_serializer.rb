class VirtualAccountant::AccountSerializer < ActiveModel::Serializer
  attributes :name, :reported_debit, :reported_credit, :reported_net, :calculated_net
  # has_many :transactions
end

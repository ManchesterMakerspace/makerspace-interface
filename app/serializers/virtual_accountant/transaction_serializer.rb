class VirtualAccountant::TransactionSerializer < ActiveModel::Serializer
  attributes :transaction_date, :description, :credit_amt, :debit_amt, :net_amt, :type, :category_name
  # belongs_to :transaction_category, serializer: VirtualAccountant::CategorySerializer, only: [:name]

  def category_name
    object.category.name
  end
end

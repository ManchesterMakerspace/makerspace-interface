class VirtualAccountant::TransactionSerializer < ActiveModel::Serializer
  attributes :transaction_date, :description, :credit_amt, :debit_amt, :type
  belongs_to :transaction_category, serializer: VirtualAccountant::CategorySerializer

  def net_amt
    (self.debit_amt - self.credit_amt)
  end
end

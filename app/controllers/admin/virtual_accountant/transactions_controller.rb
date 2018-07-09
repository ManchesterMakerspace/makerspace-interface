class Admin::VirtualAccountant::TransactionsController < AdminController

  def charts
    @membership_category = ::VirtualAccountant::Category.find_by(name: transaction_params[:category])
    @transactions = ::VirtualAccountant::Transaction.where(transaction_category: @membership_category)
    render json: @transactions.group_by_month(&:transaction_date)
  end

  private
  def transaction_params
    params.permit(:category)
  end
end

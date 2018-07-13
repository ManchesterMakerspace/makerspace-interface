class Admin::VirtualAccountant::TransactionsController < AdminController

  def charts
    membership_category = ::VirtualAccountant::Category.find_by(name: transaction_params[:category])
    @transactions = ::VirtualAccountant::Transaction.find_for_graph(
      membership_category,
      transaction_params[:startDate],
      transaction_params[:endDate]
    )
    case transaction_params[:grouping]
    when 'year'
      @transactions = @transactions.group_by_year(&:transaction_date)
    when 'quarter'
      @transactions = @transactions.group_by_quarter(&:transaction_date)
    when 'month'
      @transactions = @transactions.group_by_month(&:transaction_date)
    when 'week'
      @transactions = @transactions.group_by_week(&:transaction_date)
    when 'day'
      @transactions = @transactions.group_by_day(&:transaction_date)
    when 'hour'
      @transactions = @transactions.group_by_hour(&:transaction_date)
    else
      @transactions = @transactions.group_by_month(&:transaction_date)
    end
    render json: @transactions
  end

  private
  def transaction_params
    params.permit(:category, :grouping, :startDate, :endDate)
  end
end

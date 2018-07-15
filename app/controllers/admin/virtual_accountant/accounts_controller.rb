class Admin::VirtualAccountant::AccountsController < AdminController

  def index
    start_date = Date.parse(account_params[:startDate]) unless account_params[:startDate].nil?
    end_date = Date.parse(account_params[:endDate]) unless account_params[:endDate].nil?
    @accounts = ::VirtualAccountant::Account.find_by_date(
      start_date,
      end_date,
    )
    render json: @accounts
  end

  private
  def account_params
    params.permit(:type, :startDate, :endDate, :grouping)
  end
end

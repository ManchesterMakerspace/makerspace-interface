class Admin::VirtualAccountant::CategoriesController < AdminController

  def charts
    start_date = Date.parse(category_params[:startDate]) unless category_params[:startDate].nil?
    end_date = Date.parse(category_params[:endDate]) unless category_params[:endDate].nil?
    @membership_categories = ::VirtualAccountant::Category.find_by_type(
      category_params[:type],
      start_date,
      end_date,
    )
    render json: @membership_categories
  end

  private
  def category_params
    params.permit(:type, :startDate, :endDate, :grouping)
  end
end

class Admin::VirtualAccountant::CategoriesController < AdminController

  def charts
    @membership_categories = ::VirtualAccountant::Category.find_by_type(category_params[:type])
    render json: @membership_categories
  end

  private
  def category_params
    params.permit(:type)
  end
end

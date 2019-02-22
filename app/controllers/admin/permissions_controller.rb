class Admin::PermissionsController < AdminController
  def index
    permissions = Permissions.list_permissions
    render json: permissions and return
  end

  def update
    @member.update_permissions(update_params)
    @member.reload
    render json: @member and return
  end

  private
  def update_params
    params.require(:member).permit(permissions: {})
  end

  def find_member
    @member = Member.find(params[:id])
    raise ::Mongoid::Errors::DocumentNotFound.new(Member, { id: params[:id] }) if @member.nil?
  end
end
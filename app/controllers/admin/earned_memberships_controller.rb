class Admin::EarnedMembershipsController < AdminController
  include FastQuery
  before_action :set_membership, only: [:update, :show]

  def index
    memberships = EarnedMembership.all
    return render_with_total_items(query_resource(memberships))
  end

  def show
    render json: @membership and return
  end

  def create
    @membership = EarnedMembership.new(earned_membership_params)
    @membership.save!
    render json: @membership and return
  end

  def update
    @membership.update!(earned_membership_params)
    @membership.reload
    render json: @membership and return
  end

  private
  def earned_membership_params
    params[:earned_membership][:requirements_attributes] = params[:earned_membership].delete(:requirements)
    params.require(:earned_membership).permit(:member_id, requirements_attributes: [
      :name, :rollover_limit, :term_length, :target_count, :strict
    ])
  end

  def set_membership
    @membership = EarnedMembership.find(params[:id])
    raise ::Mongoid::Errors::DocumentNotFound.new(EarnedMembership, { id: params[:id] }) if @membership.nil?
  end
end
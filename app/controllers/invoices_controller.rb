class InvoicesController < ApplicationController
  include FastQuery
  include BraintreeGateway
  before_action :validate_params, only: [:options]

  def index
    invoices =  Invoice.where(member_id: current_member.id)
    invoices = query_resource(invoices)

    return render_with_total_items(invoices)
  end

  def options
    billing_plans = ::BraintreeService::Plan.get_plans(@gateway)
    one_time_payments = Invoice.get_default_payment_options(@invoice_options)
    invoice_options = billing_plans.map { |plan| plan.build_invoice }.concat(one_time_payments)
    render json: invoice_options and return
  end

  private
  def invoice_option_params
    params.permit(:types)
  end

  def validate_params
    @invoice_options = params[:types].nil? || !params[:types].is_a?(Array) ? Invoice::OPTION_TYPES : params[:types].map { |t| t.to_sym }
    if !@invoice_options.nil? && !@invoice_options.all? { |o| Invoice::OPTION_TYPES.include?(o) }
      raise Exception.new("Invalid invoice option type")
    end
  end
end
class InvoicesController < ApplicationController
  include BraintreeGateway
    before_action :validate_params, only: [:options]

    def index
    invoices = Invoice.where(member_id: current_member.id)
    render json: invoices and return
  end

  def options
    billing_plans = ::BraintreeService::Plan.get_plans(@gateway)
    one_time_payments = Invoice.get_default_payment_options(@invoice_options)
    invoice_options = billing_plans.map { |plan| to_option_hash(plan) }.concat(one_time_payments.map { |p| to_option_hash(p) })
    render json: invoice_options and return
  end

  private
  def invoice_option_params
    params.permit(:types)
  end

  def validate_params
    @invoice_options = params[:types].nil? ? OPTION_TYPES : params[:types].map { |t| t.to_sym }
    if !@invoice_options.nil? && !Invoice::OPTION_TYPES.include?(*@invoice_options) 
      raise Exception.new("Invalid invoice option type")
    end
  end

  def to_option_hash(object)
    hash = {}
    Invoice::InvoiceOption.members.map do |member|
      hash[member] = object.send(member)
    end
    hash
  end
end
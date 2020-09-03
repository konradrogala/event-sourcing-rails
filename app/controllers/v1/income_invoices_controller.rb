class V1::IncomeInvoicesController < ApplicationController
  def update
  end

  def show
  end

  def delete
  end

  def create
    event = Commands::IncomeInvoice::Create.call(
      accounting: accounting,
      number: permitted_params[:number],
      client_vatid: permitted_params[:client_vatid],
      total_amount: permitted_params[:total_amount],
      metadata: {}
    )

    render json: event
  end

  private

  def accounting
    @accounting ||= Accounting.find(permitted_params[:accounting_id])
  end

  def permitted_params
    params.permit(:accounting_id, :number, :client_vatid, :total_amount)
  end
end

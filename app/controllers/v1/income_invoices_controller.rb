class V1::IncomeInvoicesController < ApplicationController
  def update
  end

  def show
    render json: income_invoice
  end

  def delete
  end

  def create
    Commands::IncomeInvoice::Create.call(
      accounting: accounting,
      number: permitted_params[:number],
      client_vatid: permitted_params[:client_vatid],
      total_amount: permitted_params[:total_amount],
      month: permitted_params[:month],
      year: permitted_params[:year],
      metadata: {}
    ).tap do
      render status: :ok, json: 'Income invoice created'
    end
  end

  private

  def accounting
    @accounting ||= Accounting.find(permitted_params[:accounting_id])
  end

  def income_invoice
    @income_invoice ||= IncomeInvoice.find(permitted_params[:id])
  end

  def permitted_params
    params.permit(:accounting_id, :number, :client_vatid, :total_amount, :month, :year, :id)
  end
end

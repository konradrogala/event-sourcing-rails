class V1::AccountingsController < ApplicationController
  def show
    render json: accounting
  end

  def create
    Commands::Accounting::Create.call(
      vat_id: permitted_params[:vat_id],
      metadata: { }
    ).tap do
      render status: :ok, json: 'Accounting created'
    end
  end

  def update
    Commands::Accounting::VatActiveUpdated.call(
      accounting: accounting,
      vat_active: permitted_params[:vat_active],
      metadata: { }
    )

    render json: accounting
  end

  private

  def accounting
    @accounting ||= Accounting.find(permitted_params[:id])
  end

  def permitted_params
    params.permit(:id, :vat_active, :vat_id)
  end
end

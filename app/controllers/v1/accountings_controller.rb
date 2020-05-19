class V1::AccountingsController < ApplicationController
  def index
  end

  def create
    event = Commands::Accounting::Create.call(
      vat_id: random_vat_id,
      metadata: { }
    )

    render json: event
  end

  def update
    event = Commands::Accounting::Create.call(
      accounting: accounting,
      vat_active: vat_active,
      metadata: metadata
    )
  end

  private

  def random_vat_id
    rand.to_s[2..11]
  end

  def accounting
    @accounting ||= Accounting.find(params[:accounting_id])
  end

  def permitted_params
    params.permit(:accounting_id, :vat_active)
  end
end

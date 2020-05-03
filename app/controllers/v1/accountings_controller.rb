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

  private

  def random_vat_id
    rand.to_s[2..11]
  end
end

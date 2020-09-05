class V1::TaxLiabilitiesController < ApplicationController
  def show
    render json: tax_liability
  end

  private

  def tax_liability
    @tax_liability ||= TaxLiability.find(permitted_params[:id])
  end

  def permitted_params
    params.permit(:id)
  end
end

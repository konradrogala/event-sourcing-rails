class V1::IncomeController < ApplicationController
  def income
    Calculators::Income.new(accounting: accounting, month: {})
  end

  def tax_liabilities

  end

  private

  def random_vat_id
    rand.to_s[2..11]
  end

  def accounting
    @accounting ||= Accounting.find(params[:accounting_id])
  end

  def permitted_params
    params.permit(:accounting_id, :month)
  end
end

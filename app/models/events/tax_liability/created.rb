# frozen_string_literal: true

class Events::TaxLiability::Created < Events::TaxLiability::BaseEvent
  data_attributes :accounting_id, :vat_id, :month, :year, :tax_amount, :vat_amount

  def apply(tax_liability)
    tax_liability.accounting_id = accounting_id
    tax_liability.vat_id = vat_id
    tax_liability.month = month
    tax_liability.year = year
    tax_liability.tax_amount = tax_amount
    tax_liability.vat_amount = vat_amount

    tax_liability
  end
end

# frozen_string_literal: true

class Events::TaxLiability::AmountsUpdated < Events::TaxLiability::BaseEvent
  data_attributes :tax_amount, :vat_amount

  def apply(tax_liability)
    tax_liability.tax_amount = tax_amount
    tax_liability.vat_amount = vat_amount

    tax_liability
  end
end

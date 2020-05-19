# frozen_string_literal: true

class Events::Accounting::VatActiveUpdated < Events::Accounting::BaseEvent
  data_attributes :vat_active

  def apply(accounting)
    accounting.vat_active = vat_active

    accounting
  end
end

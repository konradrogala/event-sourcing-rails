# frozen_string_literal: true

class Events::Accounting::Created < Events::Accounting::BaseEvent
  data_attributes :vat_id

  def apply(accounting)
    accounting.vat_id = vat_id

    accounting
  end
end

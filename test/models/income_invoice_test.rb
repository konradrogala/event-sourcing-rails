require 'test_helper'

class IncomeInvoiceTest < ActiveSupport::TestCase
  include ActiveJob::TestHelper

  test "create an income invoice" do
    accounting = Accounting.create!(vat_id: "123")

    Commands::IncomeInvoice::Create.call(
      accounting: accounting,
      number: "123",
      client_vatid: "123456789",
      total_amount: "12",
      metadata: { source: 'test'}
    )

    assert_equal "123", IncomeInvoice.first!.number
  end
end

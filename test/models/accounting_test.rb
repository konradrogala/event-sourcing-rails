require 'test_helper'

class AccountingTest < ActiveSupport::TestCase
  include ActiveJob::TestHelper

  test "create an accounting" do
    # perform_enqueued_jobs do
      Commands::Accounting::Create.call(
        vat_id: "123456789",
        metadata: { source: "test"}
      )
    # end

    assert_equal "123456789", Accounting.first!.vat_id
  end

  test "update vat_active" do
    event = Commands::Accounting::Create.call(
      vat_id: "123456789",
      metadata: { source: "test accounting"}
    )

    accounting = event.accounting

    Commands::Accounting::VatActiveUpdated.call(
      accounting: accounting,
      vat_active: true,
      metadata: { source: "api" }
    )

    assert_equal true, Accounting.first!.vat_active
  end
end

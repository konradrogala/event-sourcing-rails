module Reactors
  module TaxLiability
    class Creative
      def initialize(event)
        @event = event
      end

      def perform
        if tax_liabilities.empty?
          require 'pry'; binding.pry
          Commands::TaxLiability::Create.call(
            accounting: accounting,
            month: 3,
            year: 2020,
            tax_amount: tax_amount,
            vat_amount: vat_amount,
            metadata: { }
          )
        else
          # Caluclator::TaxLiability::Update
        end
      end

      private

      attr_reader :event

      def invoice_month
        event_data["month"]
      end

      def invoice_year
        event_data["year"]
      end

      def event_data
        @event_data ||= event.data
      end

      def accounting
        Accounting.find(event_data["accounting_id"])
      end

      def tax_liabilities
        accounting.tax_liabilities.select do |tax_liability|
          (tax_liability.month) == invoice_month &&
          (tax_liability.year) == invoice_year
        end
      end

      def vat_amount
        "23"
      end

      def tax_amount
        "18"
      end
    end
  end
end

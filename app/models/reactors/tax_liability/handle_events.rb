module Reactors
  module TaxLiability
    class HandleEvents
      def initialize(event)
        @event = event
      end

      def perform
        if tax_liabilities.empty?
          Commands::TaxLiability::Create.call(
            accounting: accounting,
            month: invoice_month,
            year: invoice_year,
            tax_amount: tax_amount,
            vat_amount: vat_amount,
            metadata: { }
          )
        else
          Commands::TaxLiability::AmountsUpdated.call(
            tax_liability: tax_liability,
            tax_amount: summed_tax_amount,
            vat_amount: summed_vat_amount,
            metadata: { }
          )
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

      def tax_liability
        @tax_liability ||= tax_liabilities.first
      end

      def total_amount
        @total_amount ||= JSON.parse(event_data['total_amount']).to_f
      end

      def vat_amount
        ((total_amount * 23.0) / 123).round(2)
      end

      def tax_amount
        ((total_amount * 23.0) / 123 * 0.18).round(2)
      end

      def summed_tax_amount
        tax_liability.tax_amount.to_f + tax_amount
      end

      def summed_vat_amount
        tax_liability.vat_amount.to_f + vat_amount
      end
    end
  end
end

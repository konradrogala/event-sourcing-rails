module Calculators
  class Income
    def initialize(accounting: accounting, month: month)
      @accounting = accounting
      @month = month
    end

    def calculate
      income_invoices.inject(0) { |sum, invoice| sum + invoice.total_amount }
    end

    private

    attr_reader :accounting, :month

    def income_invoices
      accounting.income_invoices
    end
  end
end

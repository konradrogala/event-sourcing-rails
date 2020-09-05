module Reactors
  module TaxLiability
    class CreateOrUpdate
      def self.call(event)
        ::Reactors::TaxLiability::HandleEvents.new(event).perform
      end
    end
  end
end

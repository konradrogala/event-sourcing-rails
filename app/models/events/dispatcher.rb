# Subscribes Reactors to Events.
# * `trigger` will run the Reactor synchronously
# * `async` will queue up a ReactorJob to run the Reactor
class Events::Dispatcher < Lib::EventDispatcher
  on Events::IncomeInvoice::Created, trigger: Reactors::TaxLiability::CreateOrUpdate
  #on Events, async: Reactor
end

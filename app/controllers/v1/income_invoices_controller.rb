class V1::IncomeInvoicesController < ApplicationController
  def index
  end

  def create
    event = Events::IncomeInvoices::Created.create!(
      task: Task.find(params[:id]),
      metadata: { user_id: current_user&.id }
    )

    render json: event.task
  end
end

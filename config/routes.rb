Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :v1 do
    resources :income_invoices, only: [:create, :update, :show, :delete]
    resources :accountings, only: [:create, :update, :show]
    resources :tax_liabilities, only: [:show]
  end
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :v1 do
    resources :income_invoices, only: [:create]
    resources :accountings, only: [:create]

    namespace :finances do
      post 'income/:id', to: 'finances#income'
      post 'tax_liabilities/:id', to: 'finances#tax_liabilities'
    end
  end
end

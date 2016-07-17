Rails.application.routes.draw do

  root to: "products#index"
  devise_for :users

  resources :products, only: [:index, :show] do
    patch :checkout, on: :member
  end

  namespace :dashboard do
    resources :products
    resource :recipient
    resources :transactions, only: [:index, :show]
    resources :bank_accounts, only: [:index, :new, :create, :destroy], path: '/contas'
  end

end

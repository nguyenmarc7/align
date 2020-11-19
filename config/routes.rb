Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :products do
    resources :transactions, only: [:new, :create]
  end
  resources :purchases, only: [:index, :show]

  get 'my_products', to: 'my_products#index'


end

Rails.application.routes.draw do
  resources :countries, only: [:index] do
    put 'disable', on: :member
  end
  
  get 'countries/a2/*a2', to: 'countries#a2'
  get 'countries/a3/*a3', to: 'countries#a3'
end

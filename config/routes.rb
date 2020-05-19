Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :hoots, only: [:new, :index]
  end
  resource :session, only: [:new, :create, :destroy]
  resources :hoots, only: [:create, :destroy, :show]
end

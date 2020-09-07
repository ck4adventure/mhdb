Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#main'

  resources :user, only: [:show, :new, :create, :edit, :update]
  resource :session, only: [:show, :new, :create, :destroy]
end

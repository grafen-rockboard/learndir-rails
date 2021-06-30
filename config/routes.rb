Rails.application.routes.draw do

  resources :acceptances, only: [:new, :create]
  
  resources :shops
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "books#index"

  get "/books/trial", "books@trial"
  
  resources :books
end

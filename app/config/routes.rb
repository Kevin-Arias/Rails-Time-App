Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "users#index"
  get "users/new" => "users#new"
  post "users" => "users#create"
  get "users/:id" => "users#show"
  get "users/:id/edit" => "users#edit"
  patch "users/:id" => "users#update"
  resources :sessions
  get "log_out" => "sessions#destroy"


end

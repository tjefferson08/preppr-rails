Rails.application.routes.draw do
  resource :meal_plans, only: [:show, :new, :create]

  get "sign_in" => "sessions#new"
  post "sign_in" => "sessions#create"

  root "meal_plans#show"
end

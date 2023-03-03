Rails.application.routes.draw do
  resource :meal_plans, only: [:show, :new, :create]

  root "meal_plans#show"
end

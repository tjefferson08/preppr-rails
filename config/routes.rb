Rails.application.routes.draw do
  resources :meal_plans
  resources :recipes

  get "/import/new", to: "import#new"
  post "/import", to: "import#import"

  root to: redirect("/recipes")
end

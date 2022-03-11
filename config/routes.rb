Rails.application.routes.draw do
  resources :recipes

  get '/import/new', to: "import#new"
  post '/import', to: "import#import"

  # Defines the root path route ("/")
  root "recipes#index"
end

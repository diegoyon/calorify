Rails.application.routes.draw do
  resources :activities, except: [:show]
  root "activities#index"
end

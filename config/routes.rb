Rails.application.routes.draw do
  devise_for :users
  resources :activities, except: [:show]
  root "activities#index"
end

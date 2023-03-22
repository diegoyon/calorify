Rails.application.routes.draw do
  get '/chart', to: 'charts#linechart'
  devise_for :users
  resources :activities, except: [:show]
  root "activities#index"
end

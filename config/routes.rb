Rails.application.routes.draw do
  get '/chart', to: 'charts#linechart'
  devise_for :users
  resources :activities, except: [:show]
  root "activities#index"
  post '/share_chart', to: 'charts#share_chart'
end

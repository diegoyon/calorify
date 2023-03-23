Rails.application.routes.draw do
  devise_for :users
  resources :activities, except: [:show]
  root "activities#index"
  get '/chart', to: 'pages#linechart'
  post '/share_chart', to: 'pages#share_chart'
  get '/profile', to: 'pages#profile'
  post '/reset_token', to: 'pages#reset_token'
end

Rails.application.routes.draw do
  get 'users/edit'
  get 'users/update'
  devise_for :users
  resources :activities, except: [:show]
  root "activities#index"
  get '/chart', to: 'pages#linechart'
  post '/share_chart', to: 'pages#share_chart'
  get '/profile', to: 'pages#profile'
  post '/reset_token', to: 'pages#reset_token'
  resources :users, only: [:edit, :update]
  get '/calorie_data', to: 'pages#calorie_data'
end

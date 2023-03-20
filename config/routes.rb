Rails.application.routes.draw do
  get 'activities/index'
  get 'activities/new'
  get 'activities/edit'
  get 'activities/create'
  get 'activities/update'
  get 'activities/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

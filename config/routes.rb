Rails.application.routes.draw do
  resources :questions
  devise_for :users
  resources :categories
  resources :exams
  resources :colleges
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get 'filter', to: 'questions#filter'

  # Defines the root path route ("/")
  root "questions#index"
end

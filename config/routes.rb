Rails.application.routes.draw do
   
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout'}, 
             :skip => [:registrations, :password]

  get "dashboard/index"
  root "dashboard#index"

  get "weighings/find_by_period", to: "weighings#find_by_period"
  get "weighings/period_report_unit", to: "weighings#period_report_unit"

  resources :users 
  resources :employees
  resources :vehicles
  resources :costcenters
  resources :services
  resources :branches
  resources :companies
  resources :weighings
  resources :destinies
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

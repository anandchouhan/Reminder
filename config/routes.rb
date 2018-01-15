Rails.application.routes.draw do
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'admins#index'

  resources :admins do
    resources :employees, :reminders
  end 

	resources :teams do
    resources :team_members, only: [:new, :create]
  end
  resources :templates
  get 'team_members/' => 'team_members#index'


end

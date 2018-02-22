Rails.application.routes.draw do
  devise_for :users
  resources :users
  
  # unnested routes 
  resources :staff_details
  resources :payroll_details
  resources :departments
  resources :clock_ins
  resources :clock_outs
  resources :payments
  resources :teams
  resources :team_members
  resources :team_leaders
  
  # hrm routes 
  resources :users do 
    resources :staff_details
    resources :payroll_details
    resources :payments
  end
  
  # department and teams routes
  resources :departments do
    resources :teams do 
      resources :team_members
      resources :team_leaders
    end
  end
  root to: 'visitors#index'
end

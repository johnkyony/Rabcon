Rails.application.routes.draw do





  get 'time_sheet_reports/index'

  get 'timesheets/index'


  devise_scope :user do
    get "sign_out", :to => "devise/sessions#destroy"
  end

  devise_for :users
  resources :users
  
  # unnested routes 
  resources :timesheets
  resources :staff_details
  resources :payroll_details
  resources :departments
  resources :clock_ins
  resources :clock_outs
  resources :payments
  resources :teams
  resources :team_members
  resources :team_leaders
  resources :admins
  resources :staffs
  resources :clients
  resources :developers
  resources :contractors
  resources :employees
  resources :qr_codes , only:[:new , :create]
  
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
  
  # the user staff qr access code
  resources :users do 
     resources :qr_codes , only:[:new , :create]
  end
  root to: 'visitors#index'
end

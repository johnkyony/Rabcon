Rails.application.routes.draw do







  get 'timesheets/index'


  devise_scope :user do
    get "sign_out", :to => "devise/sessions#destroy"
  end

  devise_for :users
  resources :users
  
  # unnested routes 
  resources :time_sheet_reports
  resources :payroll_reports
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
  
  # the user time sheet reports
  resources :users do 
    resources :time_sheet_reports
  end
  root to: 'visitors#index'
end

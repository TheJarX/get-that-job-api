Rails.application.routes.draw do
  devise_scope :user do 
    post 'user/signin', to: 'user_sessions#create'
    delete 'user/signout', to: 'user_sessions#destroy'
  end
  devise_scope :company do 
    post 'company/signin', to: 'company_sessions#create'
    delete 'company/signout', to: 'company_sessions#destroy'
  end
  
  resources :users, except: [:index]
  resources :companies
  resources :jobs
  # APPLY FOR A JOB
  get 'jobs/:id/applications', to: 'job_applications#index'
  get 'jobs/:id/applications/:application_id', to: 'job_applications#show'
  post 'jobs/:id/apply', to: 'job_applications#create'
  put 'jobs/:id/applications/:application_id', to: 'job_applications#update'
  delete 'jobs/:id/applications/:application_id', to: 'job_applications#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

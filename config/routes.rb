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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

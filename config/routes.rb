Rails.application.routes.draw do
  namespace :management_portal do
    get '/', to: 'home#index'
    get 'login', to: 'login#index'
    post 'login', to: 'login#login'

    resources :departments
    resources :department
    get 'department/new', to: 'department#new'
    post 'departments/new', to: 'departments#create'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  namespace :management_portal do
    get 'home/index'
  end
  namespace :management_portal do
    get 'login/index'
    post 'login/login'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

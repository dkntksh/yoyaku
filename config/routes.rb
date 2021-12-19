Rails.application.routes.draw do
  namespace :management_portal do
    resources :meeting_room_reservations
  end
  namespace :management_portal do
    get '/', to: 'home#index'
    get 'login', to: 'login#index'
    post 'login', to: 'login#login'

    resources :departments
    resources :department
    get 'department/new', to: 'department#new'
    post 'departments/new', to: 'departments#create'

    resources :users
    resources :user
    get 'user/new', to: 'user#new'
    post 'user/new', to: 'user#create'

    resources :meeting_rooms
    resources :meeting_room
    get 'meeting_room/index', to: 'meeting_room#new'
    post 'meeting_room/new', to: 'meeting_room#create'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

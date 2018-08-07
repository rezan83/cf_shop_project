Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  
  devise_for :users, path: '', path_names:
    { sign_in: 'login', sign_out: 'logout', edit_user_registration: "edit_user" }, 
    controllers: { registrations: "user_registrations" }
  resources :users
  resources :products do
    resources :comments
  end
  resources :orders, only: [:index, :show, :create, :destroy]
  get 'simple_pages/about'
  get 'simple_pages/index'
  get '/user.first_name' => 'users#show'
  root 'products#index'
  get '/featured', to: 'simple_pages#landing_page'
  get 'simple_pages/contact'
  post 'simple_pages/thank_you'
  post "/payments/create"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

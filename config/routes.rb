Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/sign_out', to: 'custom_sessions#destroy', as: :custom_sign_out

  resources :users do
    resources :posts do
      member do
        post 'like'
        delete 'unlike'
      end
      resources :comments
    end
  end  
end

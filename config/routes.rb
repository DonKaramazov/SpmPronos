Rails.application.routes.draw do
  
  get 'home/index'
  mount Ckeditor::Engine => '/ckeditor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to:'users#new'

  get 'home/index'

  get '/profil', to:'users#edit', as: :profil
  patch '/profil', to:'users#update'

  # Session
  get '/login', to: 'sessions#new', as: :new_session
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :destroy_session

  resources :posts do 
    resources :comments
  end
  resources :passwords, only:[:new, :create, :edit, :update]
  resources :users, only:[:new, :create, :edit] do 
    member do 
      get 'confirm'
    end
  end
end

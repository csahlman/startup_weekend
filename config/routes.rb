Rails.application.routes.draw do
  root to: 'pages#home'
  
  controller :sessions do 
    post 'login' => :create
    delete 'logout' => :destroy
  end

  namespace :movers do 
    root to: 'dashboard#show'
  end

  resources :inquiries, only: [ :create ]

end

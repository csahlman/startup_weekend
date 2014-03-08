Rails.application.routes.draw do
  root to: 'pages#home'
  
  controller :sessions do 
    post 'login' => :create
    delete 'logout' => :destroy
  end

  namespace :dashboard do 
    root to: 'pages#dashboard'
  end

end

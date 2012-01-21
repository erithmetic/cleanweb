Cleanweb::Application.routes.draw do
  resources :students

  #devise_for :users

  root :to => 'pages#show', :id => 'home'
end

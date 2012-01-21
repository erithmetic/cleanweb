Cleanweb::Application.routes.draw do
  devise_for :students

  root :to => 'pages#show', :id => 'home'
end

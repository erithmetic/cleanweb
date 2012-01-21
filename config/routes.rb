Cleanweb::Application.routes.draw do
  devise_for :students
  resources :students

  root :to => 'high_voltage/pages#show', :id => 'home'
end

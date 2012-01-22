Cleanweb::Application.routes.draw do
  resources :exams

  devise_for :students
  resources :students

  root :to => 'high_voltage/pages#show', :id => 'home'
end

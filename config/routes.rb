Cleanweb::Application.routes.draw do
  resources :exams

  devise_for :students, :controllers => { :omniauth_callbacks => "students/omniauth_callbacks" }
  resources :students do
    resources :exams
  end

  root :to => 'high_voltage/pages#show', :id => 'home'
end

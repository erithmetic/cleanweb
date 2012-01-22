Cleanweb::Application.routes.draw do
  resources :exams

  devise_for :students, :controllers => { :omniauth_callbacks => "student/omniauth_callbacks" } do
    get "/students/sign_out" => "devise/sessions#destroy", :as => :destroy_student_session
  end
  resources :students do
    resources :exams
  end

  root :to => 'high_voltage/pages#show', :id => 'home'
end

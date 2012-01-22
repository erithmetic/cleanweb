class Student::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @student = Student.find_for_facebook_oauth(request.env["omniauth.auth"], current_student)

    if @student.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      sign_in_and_redirect @student, :event => :authentication
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_student_registration_url
    end
  end

  def tendril
    @student = Student.find_for_tendril_oauth(request.env["omniauth.auth"], current_student)

    if @student.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Tendril"
      sign_in_and_redirect @student, :event => :authentication
    else
      session["devise.tendril_data"] = request.env["omniauth.auth"]
      redirect_to new_student_registration_url
    end
  end
end

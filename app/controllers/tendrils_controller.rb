require 'tendril'
class TendrilsController < ActionController::Base
  def show
    Tendril.get_data current_student
  end
end

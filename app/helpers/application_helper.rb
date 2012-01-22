module ApplicationHelper
  def page_title
    title = case controller.class
    when HighVoltage::PagesController then
      params[:id]
    end
    title ||= 'Welcome'
    title.capitalize
  end
end

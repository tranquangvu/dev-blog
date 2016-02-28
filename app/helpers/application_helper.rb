module ApplicationHelper
  def header_height
    params[:controller] == "articles" && params[:action] == "index" && params[:page].blank? ? 'full-height' : ''
  end
end

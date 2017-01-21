class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def set_search
    @search_mountain = Mountain.search(params[:q])
    @search_climb = Climb.search(params[:q])
    @search_route = Route.search(params[:q])
  end

end

module ApplicationHelper
  def title(text)
    content_for :title, text
  end
end

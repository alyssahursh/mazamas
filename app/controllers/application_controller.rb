class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

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

  def phone_convert(phone_number)
    if !phone_number.nil?
      phone_number = phone_number.gsub(/\D/, '')
      length = phone_number.length

      if length == 10
        return number_to_phone(phone_number, area_code: true)
      else
        return number_to_phone(phone_number[0...10], area_code: true, extension: phone_number[10..-1])
      end
    end
  end

  def list(input, attribute)
    holder_array = []
    input.each do |item|
      holder_array << item[attribute]
    end
    text = holder_array.join(", ")
  end
end

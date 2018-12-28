class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def hello
    render html: "application pages"
  end
end

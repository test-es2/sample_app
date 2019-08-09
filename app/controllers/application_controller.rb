class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello
    render html: "とりあず表示"
  end

end

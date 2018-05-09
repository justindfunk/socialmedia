class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :close_impression

  private

  def close_impression
    unless current_user.nil?
      current_user.views.where(end: nil).update_all(end: Time.now)
    end
  end
end

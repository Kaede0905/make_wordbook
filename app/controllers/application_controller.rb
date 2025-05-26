class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  
  if Rails.env.development?
    skip_before_action :verify_authenticity_token
  end

  before_action :set_sign_in_status

  private
  def set_sign_in_status
    if current_user.nil?
      Rails.logger.debug "動いたよ"
      @sign_in = 0
    else
      Rails.logger.debug "サインインしてるよ"
      @sign_in = 1
    end
    Rails.logger.debug "終了"
  end
end

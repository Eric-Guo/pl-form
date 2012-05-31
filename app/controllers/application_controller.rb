class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = exception.message
    redirect_to :back
  end

	def merge_create_fields(params)
		params.merge :create_badge => current_user.badge, :create_shift_code => current_user.shift_code
	end

	def merge_update_fields(params)
		params.merge :update_badge => current_user.badge, :update_shift_code => current_user.shift_code
	end
end

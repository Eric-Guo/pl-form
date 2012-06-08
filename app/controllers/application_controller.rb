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

	def render_csv_header(filename = nil)
	  filename ||= params[:action]
	  filename += '.csv'

	  if request.env['HTTP_USER_AGENT'] =~ /msie/i
	    headers['Pragma'] = 'public'
	    headers["Content-type"] = "text/plain"
	    headers['Cache-Control'] = 'no-cache, must-revalidate, post-check=0, pre-check=0'
	    headers['Content-Disposition'] = "attachment; filename=\"#{filename}\""
	    headers['Expires'] = "0"
	  else
	    headers["Content-Type"] ||= 'text/csv'
	    headers["Content-Disposition"] = "attachment; filename=\"#{filename}\""
	  end
	end
end

class AdminController < ApplicationController

  before_action :require_admin

  # Methods omitted

  def require_admin
	if user_signed_in?
    puts "***********"
		unless current_user.is_admin?
			redirect_to root_path
		end
	else
		redirect_to root_path
	end
end


end

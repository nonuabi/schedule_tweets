class SessionController < ApplicationController
  def destroy
    if session[:user_id].present?
      session[:user_id] = nil      
      redirect_to root_path, notice: "Logout successfully!"
    end
  end
end
class SessionController < ApplicationController
  def new
  end

  def create
    if params[:email].present?
      user = User.find_by(email: params[:email])
      if user.present? && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_path, notice: "Logged In successfully."
      else 
        flash[:alert] = "Invalid email or password"
        render :new
      end
    end
  end

  def destroy
    if session[:user_id].present?
      session[:user_id] = nil      
      redirect_to root_path, notice: "Logout successfully!"
    end
  end
end
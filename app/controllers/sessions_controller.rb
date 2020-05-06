class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      render plain: "You have entered the Correct Password"
    else
      render plain: "Incorrect Password"
    end
  end
end

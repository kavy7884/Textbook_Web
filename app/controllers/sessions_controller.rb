class SessionsController < ApplicationController
  def new
  end

  def create
  	@user=User.find_by email: params[:session][:email]
  	if @user && @user.authenticate(params[:session][:password])
  		#Sign In!
  		session[:session_token]= @user.session_token
  		flash[:success]= "Welcome Login, #{@user.name}"
  		redirect_to @user

  	else
  		flash.now[:warning]= "Type Wrong Email or Password" 
  		render "new"
  	end
  end

  def destroy
  end
end

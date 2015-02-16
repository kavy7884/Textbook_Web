class SessionsController < ApplicationController
  def new
  end

  def create
  	@user=User.find_by email: params[:session][:email]
  	if @user && @user.authenticate(params[:session][:password])
  		#Sign In!
  		sign_in(@user)
  		flash[:success]= "Welcome Login, #{@user.name}"
  		redirect_to @user

  	else
  		flash.now[:warning]= "Type Wrong Email or Password" 
  		render "new"
  	end
  end

  def destroy
  	sign_out
  	redirect_to root_path
  end
end

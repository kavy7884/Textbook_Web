module SessionsHelper
	def sign_in(user) #Login User
		session[:session_token]=user.session_token;
	end

	def sign_in? #User login??
		!current_user.nil?
	end

	def current_user #Who login
		@current_user ||= User.find_by session_token: session[:session_token]		
	end

	def current_user?(user) #This user is login user?
		current_user==user
	end

	def sign_out
		@current_user=nil
		session.delete(:session_token)
	end
end

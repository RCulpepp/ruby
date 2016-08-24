class SessionsController < ApplicationController
  def create
  	puts params[:email]
  	user = User.where(email: params[:email]).first
  	if !User.exists?(email: params[:email])
  		flash[:loginErr] = 'The email or password you provided does not mach our records'
  		redirect_to '/'
  	else
  		if user.authenticate(params[:password])
  			session[:id] = user[:id]
  			session[:alias] = user[:alias]
  			redirect_to '/ideas'
  		else
  			flash[:loginErr] = 'The email or password you provided does not mach our records'
  			redirect_to '/'
  		end
  	end
  end

  def destroy
  	reset_session
  	redirect_to '/'
  end
end

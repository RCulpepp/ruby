class UsersController < ApplicationController
  ##display login/registration page
  def new
  	render 'new'
  end

  ## post to this to create user
  def create
  	user = User.create(user_params)
  	if user.valid?
  		session[:id]=user[:id]
  		session[:alias]=user[:alias]
  		redirect_to '/ideas'
  	else
  		flash[:regisErrs] = user.errors.messages
  		render 'new'
  	end
  end

  #show one users information
  def show
  	@user = User.find(params[:id])
  	if @user
  		render 'show'
  	else
  		flash[:user] = @user.errors
  	end
  end

  private
  	def user_params
  		params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
  	end
end

class LikesController < ApplicationController
  def create
  	if session[:id]
  		Like.create(user_id:session[:id], idea_id: params[:id])
  		redirect_to '/ideas'
  	else
  		redirect_to '/'
  	end
  end
end

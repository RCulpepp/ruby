class IdeasController < ApplicationController
  def index
  	if session[:id]
	  	@ideas = Idea.select('ideas.*, users.alias').joins(:user)
	  	render 'index'
	else
		redirect_to '/'
	end
  end

  def show
  	if session[:id]
	  	@idea = Idea.select('ideas.*, users.alias').joins(:user).find(params[:id])
	  	@likes = Idea.select('users.id, users.alias, users.name').joins(:likes, :user).group('users.id, users.alias, users.name')
	  	render 'show'
	else
		redirect_to '/'
	end
  end

  def create
  	if session[:id]
	  	params[:user] = session[:id]
	  	puts params
	  	idea = Idea.create(idea_params)
	  	if idea.valid?
	  		redirect_to '/ideas'
	  	else
	  		puts idea.errors.messages

	  	end
	else
		redirect_to '/'
	end
  end

  def destroy
  	if session[:id]
  		Idea.destroy(params[:id])
  		redirect_to '/ideas'
  	else
		redirect_to '/'
	end
  end

  private
  	def idea_params
  		params.require(:idea).permit(:content, :user_id)
  	end
end

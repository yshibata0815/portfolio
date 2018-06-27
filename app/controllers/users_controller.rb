class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
  	@ideas = Idea.all
  end

  def likes
  	
  	@user = User.find_by(id: params[:id])
    @likes = Like.all
    @ideas = Idea.all
  end

end

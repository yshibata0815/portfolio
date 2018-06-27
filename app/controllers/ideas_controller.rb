class IdeasController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show, :edit, :index, :destroy]

  def index
  	@ideas = Idea.all
  end

  def show
  	@idea = Idea.find_by(id: params[:id])
    @likes_count = Like.where(post_id: @idea.id).count
    @comments = Comment.all
  end

  def new
  	@idea = Idea.new
  end

  def create
  	idea = Idea.new(idea_params)
    idea.user_id = current_user.id
  	if idea.save
    	redirect_to "/ideas"
      flash[:notice] = "アイデアを投稿しました！"
    else
      flash[:notice] = "空白での投稿はできません"
      @idea = Idea.new(idea_params)
      render :new
    end
  end

  def edit
  	@idea = Idea.find(params[:id])
  end

  def update
  	idea = Idea.find(params[:id])
  	if idea.update(idea_params)
      flash[:notice] = "アイデアを編集しました"
  	  redirect_to idea_path(idea)
    else
      flash[:notice] = "空白での投稿はできません"
      redirect_to edit_idea_path(idea)
    end
  end

  def destroy
  	idea = Idea.find_by(id: params[:id])
  	idea.destroy
    flash[:notice] = "アイデアを削除しました"
  	redirect_to "/ideas"
  end

  def comment
    @comment = Comment.new(comment: params[:comment], post_id: params[:post_id], user_id: params[:user_id])
    if @comment.save
      flash[:notice] = "コメントを投稿しました"
      redirect_to :action => "show", :id => @comment.post_id
    end
  end

  private

  def idea_params
  	params.require(:idea).permit(:title, :body)
  end

end

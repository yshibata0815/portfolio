class CommentController < ApplicationController

	def destroy
		@comment = Comment.find_by(id: params[:id])
		@comment.destroy
		flash[:notice] = "コメントを削除しました"
  		redirect_to "/ideas"
	end


end
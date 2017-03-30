
class CommentsController < ApplicationController
  
  before_action :require_user
  
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.build(comment_params)
    @comment.chef = current_chef
    if @comment.save
        #perform a broadcast asap new message is created, the result of render is data who is broadcasted to the server
        ActionCable.server.broadcast "comments", render(partial: 'comments/comment', object: @comment)
      # Old: flash[:success] = "Comment was created successfully"
      # Old: redirect_to recipe_path(@recipe)
    else
      flash[:danger] = "Comment was not created"
      redirect_to :back
    end
  end
  
  private
    def comment_params
        params.require(:comment).permit(:description)
    end
end
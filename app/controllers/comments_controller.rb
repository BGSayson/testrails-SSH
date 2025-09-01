class CommentsController < ApplicationController
  def create
  @comment = Comment.new(comment_params)
  @comment.article_id = params[:id]

  if @comment.save
  redirect_to article_path(params[:id])
  else
    p "HUH"
  end
  end

  def edit
    @comment = Comment.find(params[:id])
    @comment = @article.comments.find(params[:id])
    # @comment.article_id
    # @comment.id = params[:id]
    render :edit
  end

  def update
    @article = Article.find(params[:id])
    @comment.update(comment_params)

    redirect_to article_path(params[:id])
  end

  def delete
    @comment = comment.find(params[:id])
    @comment.destroy(params[:id])
    redirect_to articles_path
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_body)
  end
end

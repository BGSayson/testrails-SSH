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
    # @comment.article_id
    # @comment.id = params[:id]
    render :edit
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)

    redirect_to article_path(@comment.article_id)
  end

  def delete
    @comment = Comment.find(params[:id])

    if @comment = Comment.delete(params[:id])
      @article = Article.find(params[:id])
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_body)
  end
end

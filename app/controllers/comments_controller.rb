class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article

  def create
    @comment = @article.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @article, notice: "Comment was successfully created."
    else
      redirect_to @article, notice: "Comment was unsuccessfully created."
    end
  end

  def destroy
    @comment = @article.comments.find(params[:id])

    if @comment.user = current_user
      @comment.destroy
      redirect_to @article, notice: "Comment was successfully deleted."
    end
  end

  private
    def set_article
      @article = Article.find(params[:article_id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end
end

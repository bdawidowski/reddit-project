class CommentsController < ApplicationController
  before_action :authenticate_user!
  # POST /comments
  # POST /comments.json
  def create
    @link = Link.find(params[:link_id])
    @comment = @link.comments.new(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_back fallback_location: root_path, notice: { success: 'Comment was successfully created.'} }
      else
        format.html { redirect_back fallback_location: root_path, notice: { danger: 'Comment was not submitted.'} }
      end
    end
  end


  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @link = @comment.link
    respond_to do |format|
      if @comment.destroy
        format.html { redirect_back fallback_location: root_path, notice: { danger: 'Comment was successfully destroyed.'} }
      else
        format.html { rredirect_back fallback_location: root_path, notice: {warning: "Comment was not destroyed."} }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:link_id, :body, :user_id)
    end
end

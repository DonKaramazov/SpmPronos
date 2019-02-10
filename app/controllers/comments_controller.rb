class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        puts params.inspect
        @comment = @post.comments.build(params.require(:comment).permit(:content))
        @comment.user_id = current_user.id
        @comment.published_at = DateTime.now
        @comment.save!
        redirect_to post_path(@post.id)
    end

    private 

    def comment_params
        puts params.inspect
        params.require(:comment).permit(:content,:post_id,:published_at)
    end
end

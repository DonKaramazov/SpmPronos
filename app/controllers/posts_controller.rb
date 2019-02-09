class PostsController < ApplicationController
    def index
       @posts = Post.all 
    end

    def new   
        @post = Post.new
    end

    def create  
        post_params = params.require(:post).permit(:title, :body, :published_at, :status)
        @post = Post.new(post_params)
        if  @post.valid?
            @post.save
            redirect_to posts_path,success: 'L\'actualité a bien été créée'
        else
            render 'new'
        end
    end

    def edit
    end

    def update
    end
end
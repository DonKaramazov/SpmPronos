class PostsController < ApplicationController
    def index
       @posts = Post.all 
    end

    def new   
        @post = Post.new
    end

    def create  
        @post = Post.new(post_params)
        if  @post.valid?
            @post.save
            redirect_to posts_path,success: 'L\'actualité a bien été créée'
        else
            render 'new'
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])  
        if(@post.update(post_params))
            redirect_to posts_path,success: 'L\'actualité a bien été modifiée'
        else
            render :edit
        end      
    end

    def destroy
        @post = Post.find(params[:id])
        if @post.destroy
            redirect_to posts_path,success: 'L\'actualité a bien été supprimé' 
        else
            redirect_to posts_path,danger: 'Une erreur est survenue lors de la suppression de l\'actualité' 
        end  
    end

    def show
        @post = Post.find(params[:id])
    end

    private 

    def post_params
        params.require(:post).permit(:title, :body, :published_at, :status)
    end
end
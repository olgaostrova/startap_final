class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    if current_user && current_user.admin?
      @posts = Post.all
    elsif current_user
      @posts = Post.where(public: true)
    end
  end
  
  def my
    if current_user
     @posts = current_user.posts
    end
   end

  def show
    @posts = Post.find(params[:id])
   end

end
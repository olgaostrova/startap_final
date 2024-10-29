class Admin::PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @posts = Post.all
  end
end
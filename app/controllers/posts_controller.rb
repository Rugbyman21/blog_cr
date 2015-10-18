class PostsController < ApplicationController
  def index
    @posts = Post.all
    render :index
  end

  def show
    @post = List.find(params[:id])
    render :show
  end
end

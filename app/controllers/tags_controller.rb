class TagsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @tag = @post.tags.new
  end
end

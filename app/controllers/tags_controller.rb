class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def new
    @post = Post.find(params[:post_id])
    @tag = @post.tags.new
  end

  def create
    @post = Post.find(params[:post_id])
    @tag = @post.tags.new(tag_params)
    if @tag.save
      redirect_to post_path(@tag.post)
    else
      render :new
    end
  end

  def show
    @tag = Tag.find(params[:id])
    @post = @tag.post
  end

  def destroy
    @tag = Tag.find(params[:id])
    tag.destroy
    redirect_to post_path(@post)
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      redirect_to tag_path(@tag)
    else
      render :edit
    end
  end

  private
    def artist_params
      params.require(:artist).permit(:name)
    end
  end

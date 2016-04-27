class PostsController < ApplicationController
  before_action :set_user

  def index
    @posts = current_user.posts
  end

  def show
    # TODO: make this happen
    # @milestone = Milestone.friendly.find(params[:id])
    @post = Post.find(params[:id])
    render :show
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to posts_path, notice: 'Post created!'
    else
      render :new
    end
  end

  def edit
    # TODO: make this happen
    # @post = Post.friendly.find(params[:id])
    @post = Post.find(params[:id])
  end

  def update
    # TODO: make this happen
    # @post = Post.friendly.find(params[:id])
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to posts_path, notice: 'Post updated!'
    else
      render :edit
    end
  end

  def destroy
    # TODO: make this happen
    # @post = Post.friendly.find(params[:id])
    @post = Post.find(params[:id])

    @post.destroy
    redirect_to :back, notice: 'Post destroyed!'
  end

  # private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end

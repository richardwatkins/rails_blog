class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: %i[show edit update destroy]
  before_action :authorize_admin!, except: %i[index show]

  def index
    @posts = Post.order(created_at: :desc)
  end

  def show; end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: "Post created successfully."
    else
      render :new
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post updated."
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: "Post deleted."
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def authorize_admin!
    redirect_to posts_path, alert: "Not authorized." unless current_user&.admin?
  end

  def post_params
    params.require(:post).permit(:title, :content, :tag_list)
  end
end

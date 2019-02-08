class PostsController < ApplicationController
  before_action :login_check, only: [:new, :edit, :update, :destroy]

  # Convention over Configuration (CoC)

  def index
    @posts = Post.where(user_id: current_user.id).order(created_at: 'desc')
    @otherposts = Post.where.not(user_id: current_user.id).order(created_at: 'desc')
  end

  def new
    @post = Post.new
  end

  def create
    # render plain: params[:post].inspect
    # save
    # @post = Post.new(params[:post])
    #@post = Post.new(params.require(:post).permit(:title, :body))
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    #@post = Post.new(user_id: current_user.id)

    if @post.save
      # redirect
      redirect_to posts_path
    else
      #render plain: @post.errors.inspect
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end


  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :image)
    end
    def login_check
      unless user_signed_in?
        flash[:alert] = "ログインしてください"
        redirect_to root_path
      end
    end
end

class PostsController < ApplicationController
  before_action :unauthenticated_user
  before_action :user_object, only: [:index, :create]


  def index
    @posts = @user.posts
  end
  
  def new
    @post = Post.new
  end

  def create
  #  @post = Post.new(params.require(:post).permit(:title, :content)) 
   
  #  @post.user_id = session[:user_id]
  
   @post = @user.posts.create(post_params)

   @post.valid?

    # return redirect_to posts_path, notice: 'Post was created' if @post.save
    return redirect_to posts_path, notice: 'Post was created' if @post.persisted?


    render 'posts/new'
   
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update

    post = Post.find(params[:id])
    post.update(post_params)
    
    redirect_to root_path
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end

  def user_object
    @user = User.find(session[:user_id])
  end
end

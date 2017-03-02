class PostsController <ApplicationController
  before_action :set_post, only: [:edit, :update, :show, :destroy]

  def new
    @post = Post.new
  end

  def edit
  end
  
  def update
    if @post.update(post_params)
      flash[:sucess] = "Post was successfully updated"
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end
  def home
     @posts = Post.all.order("created_at DESC").limit(3)
  end
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:sucess] = "Post was successfully Created"

      redirect_to post_path(@post)
    else
      render 'new'
    end 
  end

  def show
    @posts = Post.all.order("created_at ASC").limit(4).offset(1)
  end

  def index
    @posts = Post.all.order("created_at DESC")

  end
   
  def destroy
    @post.destroy
    redirect_to posts_path
    flash[:danger] = "Post Was Deleted"
  end  

 
  private
    def set_post
        @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title,:body,:image)
    end 


end
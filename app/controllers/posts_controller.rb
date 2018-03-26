class PostsController < ApplicationController

	before_action :find_post, only: [:show, :edit, :update, :downvote, :destroy, :upvote]
	before_action :authenticate_user!, except: [:index, :show]

	def index 
		@posts = Post.all.order('created_at DESC')
		@posts = Post.where(["name LIKE ?", "%#{params[:search]}%"])

	end 


	def new 
		@post = current_user.posts.build 

	end 

	def edit 

	end 


	def update 
		if 
			@post.update(post_params)
			redirect_to @post, notice: "Successfully update post"
		else 
			render "edit"
		end 
	end 


	def create 
		@post = current_user.posts.build(post_params)
		if
			@post.save 
			redirect_to @post,
			notice: "Successfully create new post"
		else 
			render "new"
		end
	end 


	def show 
		@post = Post.find(params[:id]) 
		@comments = Comment.where(post_id: @post).order("created_at DESC")
	end 


	def destroy
		@post.destroy 
		flash[:success] = "Successfully destroy post"
		redirect_to root_path
	end 


	def upvote 
		@post.upvote_from current_user
		redirect_to posts_path
	end

	def downvote 
		@post.downvote_from current_user
		redirect_to posts_path
	end

	private 

	def post_params 
		params.require(:post).permit(:title, :description, :image)
	end 

	def find_post
		@post = Post.find(params[:id]) 
	end 

end

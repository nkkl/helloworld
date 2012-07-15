class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		# save post info from form into a post object
		@post = Post.new(params[:post])
		if @post.save
			# redirect to the posts index
			redirect_to posts_url
		else
			render :action => "new"
		end
	end
end

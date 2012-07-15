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
			# redirect to the root index (which is synonymous with posts_url)
			redirect_to root_url
		else
			render :action => "new"
		end
	end

	def show
		# get the ID of the post
		id = params[:id]
		# find the post by its ID
		@post = Post.find(id)
	end

	def about
	end
end

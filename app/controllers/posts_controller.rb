class PostsController < ApplicationController
	def index
		order = params[:sort]
		order = 'created_at' if order != 'votes'
		@posts = Post.find(:all, :order => order + ' DESC')
		@title = "Hello, world"
	end

	def new
		@post = Post.new
		@title = "Hello, world - write"
	end

	def create
		# save post info from form into a post object
		# initialize the number of votes and flags to 0
		@post = Post.new(params[:post])
		@post.votes = 0
		@post.flagged = 0
		if @post.save
			# redirect to the posts index (which is routed to the root index)
			redirect_to posts_url
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

	# associated with the PUT action
	# so when we hit this url with a PUT request, this will run
	def update
		# find our post
		id = params[:id]
		@post = Post.find(id)

		# increment the number of votes
		if params[:tweet] == "true"
			@post.votes = @post.votes + 1
			@post.save
		elsif params[:flagged] == "true"
			@post.flagged = @post.flagged + 1
			@post.save
		end
		
		# TODO: ask Tom what this does again
		render :json => @post
	end

	def about
		@title = "Hello, world - about"
	end
end

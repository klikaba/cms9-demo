class PostsController < ApplicationController
  def show
    params.inspect
  	@post = Cms9::Post.find(params[:id])
  	@post_definition = Cms9::PostDefinition.find(@post.post_definition.id)
	end
end

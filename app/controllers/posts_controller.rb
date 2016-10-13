class PostsController < ApplicationController
  def index
  	@post_definition  = Cms9::PostDefinition.find(1)
    @posts = Cms9::Post.where(post_definition: @post_definition)
  end
  def show
    params.inspect
  	@post = Cms9::Post.find(params[:id])
  	@post_definition = Cms9::PostDefinition.find(@post.post_definition.id)
  end
end

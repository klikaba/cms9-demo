class PostsController < ApplicationController
  def index
  	if params[:name].blank?
  		@posts = Cms9::Post.all.limit(20).order('created_at desc')
  	else
  		post_definition = Cms9::PostDefinition.where(name: params[:name]).first
  		@posts = post_definition.posts
  	end
  end

  def show
    @post = Cms9::Post.find(params[:id])
  end
end

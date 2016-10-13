class HomeController < ApplicationController
	def index
		@post_definition  = Cms9::PostDefinition.find(1)
    @posts = @post_definition.posts[0..2]   
  end
end

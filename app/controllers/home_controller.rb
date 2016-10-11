class HomeController < ApplicationController
	def index
		@post_definition = Cms9::PostDefinition.find(2)
      	@posts = Cms9::Post.where(post_definition: @post_definition)
                  .order('created_at desc')
                  .page(params[:page])
                  .per(3)
        @blog_definition = Cms9::PostDefinition.find(1)
      	@blogs = Cms9::Post.where(post_definition: @blog_definition)
                  .order('created_at desc')
                  .page(params[:page])
                  .per(3)
        @careers_definition = Cms9::PostDefinition.find(3)
      	@careers = Cms9::Post.where(post_definition: @careers_definition)
                  .order('created_at desc')
                  .page(params[:page])
                  .per(3)
  	end
end

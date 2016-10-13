class HomeController < ApplicationController
	def index
		@blogs = blogs[0..2]
    @posts = posts[0..2]
    @careers = careers[0..2]
  end

  def blogs
  	@blog_definition  = Cms9::PostDefinitionModel.by_name('Blog')
    @blogs = @blog_definition.posts
  end

  def posts
  	@post_definition = Cms9::PostDefinitionModel.by_name('Posts')
    @posts = @post_definition.posts
  end

  def careers
  	@careers_definition = Cms9::PostDefinitionModel.by_name('Careers')
    @careers = @careers_definition.posts
  end
end

class HomeController < ApplicationController
	def index
		@products = Product.on_frontpage.limit(8)
		@brands = Brand.active.order(:name)
    @posts = Post.homepage.published
	end

end

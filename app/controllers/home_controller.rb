class HomeController < ApplicationController
	def index
		@products = Product.on_frontpage.limit(8)
		@brands = Brand.active.order(:name)
	end

end

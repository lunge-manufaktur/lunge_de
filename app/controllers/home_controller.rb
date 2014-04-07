class HomeController < ApplicationController
	def index
		@products = Product.published.limit(20)
		@brands = Brand.active.order(:name)
	end
end

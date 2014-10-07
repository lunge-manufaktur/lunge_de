class PagesController < ApplicationController
	def home
		@products = Product.on_frontpage.limit(8)
		@brands = Brand.active.order(:name)
    @posts = Post.homepage.published
	end

  def gutschein
  end

end

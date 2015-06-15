class PagesController < ApplicationController
	def home
		@products = Product.on_frontpage.published.limit(8)
		@brands = Brand.active.order(:name)
    @posts = Post.homepage.published
    @new_store = Store.where(street: "Bismarckstraße 101").first
	end

  def gutschein
  end

  def jobs
  end

  def api_docs
  end

end

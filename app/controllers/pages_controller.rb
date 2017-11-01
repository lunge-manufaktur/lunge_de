class PagesController < ApplicationController
  def home
    @products = Product.on_frontpage.published.limit(8)
    @brands = Brand.active.has_logo.order(:name)
    @posts = Post.homepage.published.order(created_at: :desc).limit(4)
    @featured_post = Post.featured.first
  end

  def gutschein
  end

  def jobs
  end

  def api_docs
  end

end

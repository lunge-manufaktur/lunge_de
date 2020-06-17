class PagesController < ApplicationController
  protect_from_forgery except: [:payments]

  def home
    @products = Product.on_frontpage.published.limit(8)
    @brands = Brand.active.has_logo.order(:name)
    @posts = Post.homepage.published.order(created_at: :desc).limit(16)
    @featured_post = Post.featured.first
  end

  def gutschein
  end

  def retoure
  end

  def jobs
  end

  def api_docs
  end

  def payments
  end

  def terms
  end

end

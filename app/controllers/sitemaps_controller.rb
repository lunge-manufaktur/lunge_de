class SitemapsController < ApplicationController
  def show
    @stores = Store.active
    @products = Product.published
    @brands = Brand.active
    @posts = Post.published
  end
end
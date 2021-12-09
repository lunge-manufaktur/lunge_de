class SitemapsController < ApplicationController
  def show
    @stores = Store.active
    @products = Product.published
    @brands = Brand.active
    @posts = Post.published
    @tags = ActsAsTaggableOn::Tag
  end
end
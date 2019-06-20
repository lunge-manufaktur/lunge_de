# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://www.lunge.de"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end

  # Stores
  add stores_path, priority: 0.9, changefreq: 'monthly', lastmod: Store.maximum(:updated_at)
  Store.find_each do |store|
    add store_path(store), priority: 0.9, changefreq: 'monthly', lastmod: store.updated_at
  end

  # Products
  add products_path, priority: 0.9, changefreq: 'daily'
  Product.published.find_each do |product|
    add product_path(product), priority: 0.9, changefreq: 'daily', lastmod: product.updated_at
  end

  # Brands
  Brand.active.find_each do |brand|
    add brand_path(brand), priority: 0.7, changefreq: 'daily'
  end

  # Posts
  add posts_path, priority: 0.7, changefreq: 'daily'
  Post.published.find_each do |post|
    add post_path(post), priority: 0.8, changefreq: 'daily', lastmod: post.updated_at
  end

  # Contact
  add contact_path, priority: 0.4, changefreq: 'monthly'
end

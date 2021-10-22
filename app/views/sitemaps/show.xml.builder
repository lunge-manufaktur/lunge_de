base_url = "https://shop.lunge.de"
xml.instruct! :xml, version: '1.0'
xml.tag! 'urlset', 'xmlns' => 'http://www.sitemaps.org/schemas/sitemap/0.9' do
  xml.url{
      xml.loc("#{base_url}")
      xml.changefreq("daily")
      xml.priority(1.0)
  }

  # stores
  xml.url {
    xml.loc(stores_url)
    xml.changefreq("weekly")
    xml.priority(0.9)
  }
  @stores.each do |store|
    xml.url{
        xml.loc(store_url(store))
        xml.changefreq("weekly")
        xml.priority(0.9)
    }
  end

  # posts
  xml.url {
    xml.loc("#{base_url}/category/beratung")
    xml.changefreq("daily")
    xml.priority(0.8)
  }
  @posts.each do |post|
    xml.url {
      xml.loc(post_url(post))
      xml.changefreq("weekly")
      xml.priority(0.8)
    }
  end

  # brands
  @brands.each do |brand|
    xml.url {
      xml.loc(brand_url(brand))
      xml.changefreq("daily")
      xml.priority(0.7)
    }
  end

  # products
  xml.url {
    xml.loc(products_url)
    xml.changefreq("daily")
    xml.priority(0.9)
  }
  @products.find_each do |product|
    xml.url {
      xml.loc(product_url(product))
      xml.changefreq("daily")
      xml.priority(1.0)
    }
  end
end
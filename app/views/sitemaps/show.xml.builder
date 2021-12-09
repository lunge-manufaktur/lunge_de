base_url = "https://shop.lunge.de"
xml.instruct! :xml, version: '1.0'
xml.tag! 'urlset', 'xmlns' => 'http://www.sitemaps.org/schemas/sitemap/0.9' do
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

  @tags.find_each do |tag|
    xml.url {
      xml.loc(tag_products_url(tag.name.gsub(' ', '-')))
      xml.changefreq("daily")
      xml.priority(0.8)
    }
  end
end
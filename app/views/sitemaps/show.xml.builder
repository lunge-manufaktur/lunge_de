base_url = "https://shop.lunge.de"
xml.instruct! :xml, version: '1.0'
xml.tag! 'urlset', 'xmlns' => 'http://www.sitemaps.org/schemas/sitemap/0.9' do
  xml.url{
      xml.loc("#{base_url}")
      xml.changefreq("daily")
      xml.priority(1.0)
  }

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
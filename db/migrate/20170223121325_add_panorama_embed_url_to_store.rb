class AddPanoramaEmbedUrlToStore < ActiveRecord::Migration[5.0]
  def change
    add_column :stores, :panorama_embed_url, :text
  end
end

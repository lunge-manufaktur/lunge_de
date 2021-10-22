class AddFrontendUrlToStores < ActiveRecord::Migration[6.1]
  def change
    add_column :stores, :frontend_url, :string
  end
end

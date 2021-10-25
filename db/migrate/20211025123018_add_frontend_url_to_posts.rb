class AddFrontendUrlToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :frontend_url, :string
  end
end

class AddUseInLiaCampaignToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :use_in_lia_campaign, :boolean, default: false
    add_index :products, :use_in_lia_campaign
  end
end

class AddNestedSetFieldsToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :lft, :integer, index: true
    add_column :categories, :rgt, :integer, index: true
    add_column :categories, :depth, :integer, index: true
  end
end

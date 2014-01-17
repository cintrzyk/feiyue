class AddDocToSpreeProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :doc, :string
  end
end

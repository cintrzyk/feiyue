class CreateSpreePosts < ActiveRecord::Migration
  def up
    create_table :spree_posts do |t|
      t.string :title
      t.text :description
      t.timestamps
    end
  end

  def down
    drop_table :spree_posts
  end
end

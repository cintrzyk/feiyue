class CreateSpreeContacts < ActiveRecord::Migration
  def up
    create_table :spree_contacts do |t|
      t.string  :name
      t.string  :phone
      t.string  :email
      t.decimal :asize, precision: 3, scale: 1
      t.decimal :bsize, precision: 3, scale: 1
      t.decimal :csize, precision: 3, scale: 1
      t.decimal :dsize, precision: 3, scale: 1
      t.decimal :esize, precision: 3, scale: 1
      t.string  :orientation
      t.string  :address
      t.string  :size
      t.string  :roof
      t.text    :question

      t.timestamps
    end
  end

  def down
    drop_table :spree_contacts
  end
end

class AddQuestionToSpreeContacts < ActiveRecord::Migration
  def change
    add_column :spree_contacts, :question, :text
  end
end

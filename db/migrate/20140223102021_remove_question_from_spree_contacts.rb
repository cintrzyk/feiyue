class RemoveQuestionFromSpreeContacts < ActiveRecord::Migration
  def change
    remove_column :spree_contacts, :question
  end
end

class ChangeImaginationReferences < ActiveRecord::Migration[7.0]
  def change
    remove_column :imaginations, :addicdatum_id
    add_reference :imaginations, :imaginationtexts,foreign_key: true
  end
end

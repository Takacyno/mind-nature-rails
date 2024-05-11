class RenameImaginationReference < ActiveRecord::Migration[7.0]
  def change
    rename_column :imaginations,:imaginationtexts_id, :imaginationtext_id
  end
end

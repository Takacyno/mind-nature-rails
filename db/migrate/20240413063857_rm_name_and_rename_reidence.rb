class RmNameAndRenameReidence < ActiveRecord::Migration[7.0]
  def change
    rename_column :patients, :residene, :residence
    remove_column :patients, :name
  end
end

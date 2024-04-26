class ChangeToArray < ActiveRecord::Migration[7.0]
  def change
    remove_column :patients, :testshow
    add_column :patients, :testshow, :integer, array: true, default: []
    remove_column :patients, :addictions
    add_column :patients, :addiction, :integer, array: true, default: []
  end
end

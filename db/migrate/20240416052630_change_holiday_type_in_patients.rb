class ChangeHolidayTypeInPatients < ActiveRecord::Migration[7.0]
  def change
    remove_column :patients, :holiday, :text
    add_column :patients, :holiday, :boolean, array: true, default: [0,0,0,0,0,0,0]
  end
end

class ChangeHolidayData < ActiveRecord::Migration[7.0]
  def change
    remove_column :patients, :holiday
    add_column :patients, :holiday, :integer, array: true, default: []
  end
end

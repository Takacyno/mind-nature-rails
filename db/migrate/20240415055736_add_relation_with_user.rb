class AddRelationWithUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :userable, polymorphic: true, index: true
    remove_column :patients, :patientid
    add_column :patients, :id, :primary_key
    add_reference :patients, :user, foreign_key: true
    remove_column :counsellors, :counsellorid
    add_column :counsellors, :id, :primary_key
    add_reference :counsellors, :user, foreign_key: true
  end
end

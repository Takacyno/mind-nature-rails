class SetPrimaryKeyToCounsellorAndPatient < ActiveRecord::Migration[7.0]
  def change
    change_table :counsellors, id: false do |t|
      t.remove :id
    end
    add_column :counsellors, :counsellorid, :bigint,primary_key: true
    change_table :patients, id: false do |t|
      t.remove :id
    end
    add_column :patients, :patientid, :bigint,primary_key: true
  end
end

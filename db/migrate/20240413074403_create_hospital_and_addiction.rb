class CreateHospitalAndAddiction < ActiveRecord::Migration[7.0]
  def change
    create_table :hospitals do |t|
      t.string :name
      t.timestamps
    end
    create_table :addictions do |t|
      t.string :name
      t.timestamps
    end
  end
end

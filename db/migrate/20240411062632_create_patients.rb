class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.integer :hospital
      t.integer :age
      t.integer :sex
      t.string :counsellors
      t.string :residene
      t.string :rhythmoflife
      t.string :interests
      t.string :profession
      t.string :workexp
      t.string :harshchildhoodexp
      t.string :criminalrecord
      t.string :othertraumas
      t.string :supplement
      t.string :goal
      t.string :testshow
      t.string :addictions
      t.string :holiday

      t.timestamps
    end
  end
end

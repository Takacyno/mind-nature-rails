class CreateFuneventabstracts < ActiveRecord::Migration[7.0]
  def change
    create_table :funeventabstracts do |t|
      t.references :patient, null: false, foreign_key: true
      t.string :abstract,null: false
      t.timestamps
    end
  end
end

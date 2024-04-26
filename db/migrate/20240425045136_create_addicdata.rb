class CreateAddicdata < ActiveRecord::Migration[7.0]
  def change
    create_table :addicdata do |t|
      t.integer :what ,null:false
      t.integer :severity
      t.string :progress
      t.string :difficulties
      t.string :frequency
      t.string :trouble
      t.string :method
      t.string :goal
      t.string :controlstimulustext
      t.text :controlstimulusinstruction
      t.text :pseudoactinstruction
      t.text :imaginationinstruction
      t.boolean :essayok
      t.text :essay
      t.string :supplement

      t.timestamps
    end
  end
end

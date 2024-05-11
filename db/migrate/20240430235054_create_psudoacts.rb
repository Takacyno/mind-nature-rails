class CreatePsudoacts < ActiveRecord::Migration[7.0]
  def change
    create_table :psudoacts do |t|
      t.references :addicdatum, null: false, foreign_key: true
      t.string :autonomicnervesbefore
      t.string :feelingbefore
      t.string :directionbefore
      t.integer :drivingforcebefore
      t.string :otherbefore
      t.string :othertextbefore
      t.string :autonomicnervesafter
      t.string :feelingafter
      t.string :directionafter
      t.integer :drivingforceafter
      t.string :otherafter
      t.string :othertextafter
      t.integer :completion
      t.integer :interruption
      t.string :interruptiontext
      t.integer :post
      t.string :posttext
      t.integer :people
      t.string :peopletext
      t.integer :timezone
      t.timestamps
    end
  end
end
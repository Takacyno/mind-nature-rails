class CreateImaginations < ActiveRecord::Migration[7.0]
  def change
    create_table :imaginations do |t|
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
      t.integer :num
      t.string :word, array:true
      t.timestamps
    end
  end
end

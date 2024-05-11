class ChangePseudoactAndImagination < ActiveRecord::Migration[7.0]
  def change
    drop_table :pseudoacts
    drop_table :imaginations
    create_table :psudoacts do |t|
      t.references :addicdatum, null: false, foreign_key: true
      t.integer  :autonomicnervesbefore,array:true,default:[]
      t.integer  :feelingbefore,array:true,default:[]
      t.integer  :directionbefore,array:true,default:[]
      t.integer :drivingforcebefore
      t.integer  :otherbefore,array:true,default:[]
      t.string  :othertextbefore
      t.integer  :autonomicnervesafter,array:true,default:[]
      t.integer  :feelingafter,array:true,default:[]
      t.integer  :directionafter,array:true,default:[]
      t.integer :drivingforceafter
      t.integer  :otherafter,array:true,default:[]
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
    create_table :imaginations do |t|
      t.references :addicdatum, null: false, foreign_key: true
      t.integer  :autonomicnervesbefore,array:true,default:[]
      t.integer  :feelingbefore,array:true,default:[]
      t.integer  :directionbefore,array:true,default:[]
      t.integer :drivingforcebefore
      t.integer  :otherbefore,array:true,default:[]
      t.string  :othertextbefore
      t.integer  :autonomicnervesafter,array:true,default:[]
      t.integer  :feelingafter,array:true,default:[]
      t.integer  :directionafter,array:true,default:[]
      t.integer :drivingforceafter
      t.integer  :otherafter,array:true,default:[]
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

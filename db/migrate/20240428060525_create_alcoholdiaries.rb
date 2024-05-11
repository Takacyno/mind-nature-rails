class CreateAlcoholdiaries < ActiveRecord::Migration[7.0]
  def change
    create_table :alcoholdiaries do |t|
      t.integer :beer,array:true,default: []
      t.integer :strong,array:true,default: []
      t.integer :jpricewine,array:true,default: []
      t.integer :wine,array:true,default: []
      t.integer :shochu,array:true,default: []
      t.integer :whisky,array:true,default: []
      t.integer :highball,array:true,default: []
      t.string :other
      t.references :diary, null: false, foreign_key: true
      t.timestamps
    end
  end
end
class CreateFuneventconcretes < ActiveRecord::Migration[7.0]
  def change
    create_table :funeventconcretes do |t|
      t.references :funeventabstract, null: false, foreign_key: true
      t.string :concrete,null: false
      t.timestamps
    end
  end
end

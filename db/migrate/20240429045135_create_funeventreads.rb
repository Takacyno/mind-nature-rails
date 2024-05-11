class CreateFuneventreads < ActiveRecord::Migration[7.0]
  def change
    create_table :funeventreads do |t|
      t.references :funeventabstract, null: false, foreign_key: true
      t.string :word,array:true
      t.timestamps
    end
  end
end

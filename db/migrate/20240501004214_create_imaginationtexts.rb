class CreateImaginationtexts < ActiveRecord::Migration[7.0]
  def change
    create_table :imaginationtexts do |t|
      t.references :addicdatum, null: false, foreign_key: true
      t.text :imaginationtext
      t.timestamps
    end
  end
end

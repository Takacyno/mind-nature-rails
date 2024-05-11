class CreateEssayreads < ActiveRecord::Migration[7.0]
  def change
    create_table :essayreads do |t|
      t.integer :num
      t.references :addicdatum, null: false, foreign_key: true
      t.timestamps
    end
  end
end

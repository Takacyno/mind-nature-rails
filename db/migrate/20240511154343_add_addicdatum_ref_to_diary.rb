class AddAddicdatumRefToDiary < ActiveRecord::Migration[7.0]
  def change
    add_reference :diaries, :addicdatum, null: false, foreign_key: true
  end
end

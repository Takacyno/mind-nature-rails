class CreateDiaries < ActiveRecord::Migration[7.0]
  def change
    create_table :diaries do |t|
      t.datetime :starttime
      t.datetime :endtime
      t.string :place
      t.string :people
      t.string :impetus
      t.timestamps
    end
  end
end

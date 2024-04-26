class CreateCounsellors < ActiveRecord::Migration[7.0]
  def change
    create_table :counsellors, id: false do |t|
      t.bigint :id ,unique:true
      t.integer :hospital,null:false

      t.timestamps
    end
  end
end

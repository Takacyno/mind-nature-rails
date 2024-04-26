class ChangeUserclass < ActiveRecord::Migration[7.0]
  def change
     change_column :users, :userclass, :boolean, using: 'userclass::boolean' ,default:false,null:false  
     rename_column :users, :userclass, :counsellor
  end
end

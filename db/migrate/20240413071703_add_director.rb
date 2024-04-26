class AddDirector < ActiveRecord::Migration[7.0]
  def change
    add_column:users, :director, :boolean,default:false,null:false
  end
end

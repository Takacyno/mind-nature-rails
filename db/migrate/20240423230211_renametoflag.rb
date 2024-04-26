class Renametoflag < ActiveRecord::Migration[7.0]
  def change
    rename_column :users,:admin,:adminflag
    rename_column :users,:director,:directorflag
    rename_column :users,:counsellor,:counsellorflag
  end
end

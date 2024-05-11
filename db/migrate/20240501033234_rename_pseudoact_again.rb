class RenamePseudoactAgain < ActiveRecord::Migration[7.0]
  def change
    rename_table :psudoacts,:pseudoacts
  end
end

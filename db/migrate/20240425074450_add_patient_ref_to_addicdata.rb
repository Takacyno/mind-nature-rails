class AddPatientRefToAddicdata < ActiveRecord::Migration[7.0]
  def change
    add_reference :addicdata, :patient, null: false, foreign_key: true
  end
end

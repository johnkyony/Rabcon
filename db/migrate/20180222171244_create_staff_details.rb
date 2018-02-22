class CreateStaffDetails < ActiveRecord::Migration
  def change
    create_table :staff_details do |t|
      t.string :employee_full_name
      t.string :address
      t.datetime :birthdate
      t.string :id_or_passport_number
      t.string :employee_number
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

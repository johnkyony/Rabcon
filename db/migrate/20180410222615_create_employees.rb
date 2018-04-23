class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :full_name
      t.string :address
      t.datetime :birthdate
      t.string :id_or_passport_number

      t.timestamps null: false
    end
  end
end

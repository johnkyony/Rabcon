class CreateTaxes < ActiveRecord::Migration
  def change
    create_table :taxes do |t|
      t.string :name
      t.float :amount

      t.timestamps null: false
    end
  end
end

class CreateDailyPayments < ActiveRecord::Migration
  def change
    create_table :daily_payments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :clock_in, index: true, foreign_key: true
      t.references :clock_out, index: true, foreign_key: true
      t.float :amount

      t.timestamps null: false
    end
  end
end

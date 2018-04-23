class CreateTimesheets < ActiveRecord::Migration
  def change
    create_table :timesheets do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :team_leader, index: true, foreign_key: true
      t.time :clock_in_at
      t.time :clock_out_at
      t.date :punch_in_on

      t.timestamps null: false
    end
  end
end

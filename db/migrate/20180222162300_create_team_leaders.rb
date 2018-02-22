class CreateTeamLeaders < ActiveRecord::Migration
  def change
    create_table :team_leaders do |t|
      t.references :team, index: true, foreign_key: true
      t.references :team_member, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

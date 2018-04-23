class AddEmployeeToTeamMembers < ActiveRecord::Migration
  def change
    add_reference :team_members, :employee, index: true, foreign_key: true
  end
end

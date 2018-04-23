# == Schema Information
#
# Table name: timesheets
#
#  id             :integer          not null, primary key
#  employee_id    :integer
#  team_leader_id :integer
#  clock_in_at    :time
#  clock_out_at   :time
#  punch_in_on    :date
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Timesheet < ActiveRecord::Base
  belongs_to :employee
  belongs_to :team_leader
end

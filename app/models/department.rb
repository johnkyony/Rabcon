# == Schema Information
#
# Table name: departments
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Department < ActiveRecord::Base
    validates :name , presence: true 
    validates :description , presence: true
    validates_uniqueness_of :name
end

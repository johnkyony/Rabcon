class Deparment < ActiveRecord::Base
    validates :name , presence: true 
    validates :description , presence: true
    validates_uniqueness_of :name
end

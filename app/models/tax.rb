# == Schema Information
#
# Table name: taxes
#
#  id         :integer          not null, primary key
#  name       :string
#  amount     :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tax < ActiveRecord::Base
end

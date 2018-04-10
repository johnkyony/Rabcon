# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string
#  role                   :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#


class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum role: [:client, :staff , :contractor , :developer, :admin]
  after_initialize :set_default_role, :if => :new_record?
  has_many :team_members
  has_many :team_leaders 
  has_many :payroll_details
  has_many :staff_details
  has_many :payments
  has_many :clock_in
  has_many :clock_out
  has_many :daily_payment
  def set_default_role
    self.role ||= :client
  end
end

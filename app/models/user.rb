
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum role: [:client, :staff , :contractor , :developer, :admin]
  after_initialize :set_default_role, :if => :new_record?
  has_many :team_members
  has_many :team_leaders

  def set_default_role
    self.role ||= :client
  end
end

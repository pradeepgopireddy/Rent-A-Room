class User < ApplicationRecord
  has_many :reviews
  has_many :bookings
	belongs_to :role
	has_many :rooms
  before_validation :assign_user_role, on: :create
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :username, :email, :first_name, :last_name, :mobile, :role_id
  validates_uniqueness_of :email
  

   def assign_user_role
   		self.role_id = Role.last.id
   end

   def role?(role_name)
    self.role.name == role_name
  end
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :first_name, :last_name, :age, :email,
  presence: true
     
  validates :email, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }

  belongs_to :city
  has_many :gossips
  has_many :likes
end

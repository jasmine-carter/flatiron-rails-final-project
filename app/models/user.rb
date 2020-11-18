class User < ApplicationRecord
  has_secure_password
  has_many :workouts
  has_many :exercises

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true
  validates :password, presence: true
end

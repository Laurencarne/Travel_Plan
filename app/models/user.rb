class User < ApplicationRecord
  has_many :trips
  has_many :reviews
  has_many :likes, through: :reviews
  has_many :trip_countries, through: :trips
  has_many :countries, through: :trip_countries
  has_many :selected_activities, through: :trip_countries
  has_many :activities, through: :selected_activities

  validates :name, uniqueness: true
  validates :first_name, presence: true, format: { with: /\A[a-zA-Z'-]*\z/}
  validates :last_name, presence: true, format: { with: /\A[a-zA-Z'-]*\z/}
  validates :password, presence: true

  validates :first_name, length: {minimum: 2}
  validates :first_name, length: {maximum: 100}
  validates :last_name, length: {minimum: 2}
  validates :last_name, length: {maximum: 100}
  validates :name, length: {minimum: 2}
  validates :name, length: {maximum: 100}
  validates :password, length: {minimum: 2}
  validates :password, length: {maximum: 16}

  has_secure_password

end

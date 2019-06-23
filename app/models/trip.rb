class Trip < ApplicationRecord
  belongs_to :user
  has_many :trip_countries
  has_many :countries, through: :trip_countries
  has_many :selected_activities, through: :trip_countries

  def self.mine
    @user = User.find_by(id: session[:user_id])
    self.all.select{|trip| trip.user_id == @user.id}
  end
end

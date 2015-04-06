# == Schema Information
#
# Table name: owners
#
#  id              :integer          not null, primary key
#  username        :string(255)
#  restaurant_name :string(255)
#  address         :string(255)
#  password        :string(255)
#  category        :string(255)
#  plan            :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Owner < ActiveRecord::Base
  attr_accessible :address, :category, :password, :plan, :restaurant_name, :username

  validates :username, :presence => true
  validates :password, :presence => true
  validates :restaurant_name, :presence => true
  validates :address, :presence => true
  validates_uniqueness_of :username

  has_many :coupons
end
# == Schema Information
#
# Table name: coupons
#
#  id         :integer          not null, primary key
#  username   :string(255)
#  content    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Coupon < ActiveRecord::Base
  attr_accessible :content, :username

  validates :username, :presence => true
  validates :content, :presence => true
  validates_uniqueness_of :content, :scope => :username
end

# == Schema Information
#
# Table name: reviews
#
#  id          :integer          not null, primary key
#  review_id   :string(255)
#  stars       :integer
#  date        :string(255)
#  text        :string(255)
#  business_id :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Review < ActiveRecord::Base
  attr_accessible :business_id, :date, :review_id, :stars, :text
end

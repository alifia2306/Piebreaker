# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  business_id     :string(255)
#  full_address    :string(255)
#  categories      :string(255)
#  city            :string(255)
#  review_count    :integer
#  name            :string(255)
#  state           :string(255)
#  price_range     :integer
#  wifi            :boolean
#  parking         :boolean
#  delivery        :boolean
#  outdoor_seating :boolean
#  rating          :float
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :business_id, :categories, :city, :delivery, :full_address, :name, :outdoor_seating, :parking, :price_range, :rating, :review_count, :state, :wifi

  # def self.search(search,location)
    
  # end

end

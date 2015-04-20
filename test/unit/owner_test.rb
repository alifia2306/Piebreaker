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

require 'test_helper'

class OwnerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

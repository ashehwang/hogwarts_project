# == Schema Information
#
# Table name: hoots
#
#  id             :bigint           not null, primary key
#  author_id      :integer          not null
#  body           :text             not null
#  parent_hoot_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require 'test_helper'

class HootTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

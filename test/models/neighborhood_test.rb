require "test_helper"

class NeighborhoodTest < ActiveSupport::TestCase
  test "must have name" do 
    neighborhood = Neighborhood.new()
    assert neighborhood.invalid?
    assert neighborhood.errors[:name].any?
  end
end

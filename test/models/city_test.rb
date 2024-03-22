require "test_helper"

class CityTest < ActiveSupport::TestCase
  test "city unique name" do
    existing_city = City.create(name: "Boston")
    duplicate_city = City.new(name: "Boston")
    assert duplicate_city.invalid?
    assert duplicate_city.errors[:name].any?
  end

  test "name exists" do 
    city = City.create(name: "")
    assert city.invalid?
    assert city.errors[:name].any?
  end
end

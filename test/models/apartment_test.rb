require "test_helper"

class ApartmentTest < ActiveSupport::TestCase
  test "need street address" do
    apartment = Apartment.new()
    assert apartment.invalid?
    assert apartment.errors[:street_address].any?
  end

  test "rent greater than 100" do
    apartment = Apartment.new(street_address: "100", rent: 99)
    assert apartment.invalid?
    assert apartment.errors[:rent].any?
  end

  test "atleast 1 bedroom" do 
    apartment = Apartment.new(street_address: "100", rent: 101, bedrooms: 0)
    assert apartment.invalid?
    assert apartment.errors[:bedrooms].any?
  end
end

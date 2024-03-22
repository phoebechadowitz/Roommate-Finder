require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "user unique email" do
    existing_user = User.create!(email: "pc244@duke.edu", password: "secret")
    duplicate_user = User.new(email: "pc244@duke.edu", password: "secret")
    assert duplicate_user.invalid?
    assert duplicate_user.errors[:email].any?
  end

  test "must have email" do 
    user = User.new()
    assert user.invalid?
    assert user.errors[:email].any?
  end

  test "must include at symbol" do
    user = User.create(email: "phoebe")
    assert user.invalid?
    assert user.errors[:email].any?
  end
end

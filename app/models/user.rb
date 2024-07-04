class User < ApplicationRecord
  has_secure_password
  has_one :profile, dependent: :destroy
  belongs_to :apartment, optional: true
  has_many :apartment_requests, dependent: :destroy
  has_many :applied_apartments, through: :apartment_requests, source: :apartment

  after_create :create_profile

  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\.[^@\s]+\z/ }

  def email=(value)
    super(value.downcase)
  end

  def create_profile
    name = email.split("@").first
    new_profile = self.build_profile(name: name)
    new_profile.save!
  end
end


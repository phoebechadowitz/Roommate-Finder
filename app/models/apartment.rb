class Apartment < ApplicationRecord
  belongs_to :neighborhood
  belongs_to :city
  has_many :residents, class_name: "User"
  has_many :apartment_requests, dependent: :destroy
  has_many :applicants, through: :apartment_requests, source: :applicant

  validates :street_address, presence: true
  validates :rent, presence: true, numericality: { greater_than_or_equal_to: 100 }
  validates :bedrooms, presence: true, numericality: { greater_than_or_equal_to: 1 }

  def remaining_bedrooms
    return bedrooms - residents.count
  end

  def unoccupied?
    if residents.count == 0
      return true
   else
      return false
   end
  end

  def current_resident?(user)
    if user.apartment_id == id 
      return true
    else 
      return false
    end
  end

  def request(user)
    user.apartment_requests.where(apartment_id: self.id).first
  end
  
  def requested?(user)
    request(user).present?
  end

  def request_pending?(user)
    request(user)&.pending?
  end
end

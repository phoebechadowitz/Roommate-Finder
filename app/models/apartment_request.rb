class ApartmentRequest < ApplicationRecord
  belongs_to :apartment
  belongs_to :applicant, class_name: "User", foreign_key: :user_id

  enum :status, [:pending, :approved, :denied, :superseded], default: :pending

  def approve
    self.update(status: :approved)
    applicant.apartment_requests.where(status: :pending).update_all(status: :superseded)
    applicant.update(apartment_id: apartment_id)
  end
  
  def deny
    self.update(status: :denied)
  end

end

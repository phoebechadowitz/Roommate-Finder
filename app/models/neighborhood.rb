class Neighborhood < ApplicationRecord
  belongs_to :city
  has_many :apartments, dependent: :destroy
  validates :name, presence: true
end

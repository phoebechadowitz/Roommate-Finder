class City < ApplicationRecord
    has_many :apartments
    has_many :neighborhoods, dependent: :destroy
    validates :name, presence: true, uniqueness: true
end

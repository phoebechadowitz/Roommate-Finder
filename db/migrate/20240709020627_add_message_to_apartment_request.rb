class AddMessageToApartmentRequest < ActiveRecord::Migration[7.1]
  def change
    add_column :apartment_requests, :message, :text
  end
end

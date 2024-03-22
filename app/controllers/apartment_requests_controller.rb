class ApartmentRequestsController < ApplicationController
    before_action :set_apartment
    before_action :set_apartment_request, only: %i[ destroy update ]

    def create
        @apartment_request = ApartmentRequest.new(apartment: @apartment, applicant: current_user, status: :pending)
        if @apartment_request.save
            redirect_to apartment_url(@apartment), notice: "You sent in an application"
        else
            redirect_to apartment_url(@apartment), status: :unprocessable_entity
        end
    end
    
    def destroy
        @apartment_request.destroy!
        redirect_to apartment_url(@apartment)
    end

    def update
        if params[:status] == "approved"
        @apartment_request.approve
        elsif params[:status] == "denied"
        @apartment_request.deny
        else
        @apartment_request.update(status: params[:status])
        end
        redirect_to apartment_url(@apartment)
    end 


    def set_apartment
        @apartment = Apartment.find(params[:apartment_id])
    end

    def set_apartment_request
        @apartment_request = @apartment.apartment_requests.find(params[:id])
    end
end

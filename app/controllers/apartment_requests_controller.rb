class ApartmentRequestsController < ApplicationController
    before_action :set_apartment_creation, only: %i[ create ]
    before_action :set_apartment, only: %i[ destroy update ]
    before_action :set_apartment_request, only: %i[ destroy update ]

    def create
        if (@apartment.residents.count < @apartment.bedrooms)
            message = params[:apartment_request][:message]
            @apartment_request = ApartmentRequest.new(apartment: @apartment, applicant: current_user, status: :pending, message: message)
            if @apartment_request.save
                redirect_to apartment_url(@apartment), notice: "You sent in an application"
            else
                redirect_to apartment_url(@apartment), status: :unprocessable_entity
            end
        else 
            redirect_to apartment_url(@apartment), notice: "Apartment application could not be sent because apartment is already full"
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


    def set_apartment_creation
        @apartment = Apartment.find(params[:apartment_request][:apartment_id])
    end

    def set_apartment
        @apartment = Apartment.find(params[:apartment_id])
    end

    def set_apartment_request
        @apartment_request = @apartment.apartment_requests.find(params[:id])
    end
end

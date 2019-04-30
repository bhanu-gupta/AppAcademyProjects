class CatRentalRequestsController < ApplicationController

    def new
        @cats = Cat.all
        @request = CatRentalRequest.new
        render :new
    end

    def create
        @request = CatRentalRequest.new(cat_rental_request_params)
        if @request.save
            redirect_to cat_url(cat_rental_request_params[:cat_id])
        else
            @cats = Cat.all
            render :new
        end
    end

    def approve
        @request = CatRentalRequest.find(params[:id])
        if @request.approve!
            redirect_to cat_url(id: cat_rental_request_params[:cat_id])
        else 
            render json: 'errors'
        end
    end

    private

    def cat_rental_request_params
        params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date)
    end
end
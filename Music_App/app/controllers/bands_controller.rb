class BandsController < ApplicationController
    def index
        @bands = Band.all
        render :index
    end
    def show 
        @band = Band.find_by(id: params[:id])
        render json: @band
    end
    def new 
        @band = Band.new
        render :new
    end
    def create
        @band = Band.new(band_params)
        if @band.save!
            redirect_to bands_url
        else
            render json: @band.errors.full_messages, status: 422
        end
    end

    def edit
        @band = Band.find_by(id: params[:id])
        render :edit
    end
    def update
        @band = Band.find_by(id: params[:id])

        if @band.update(band_params)
            redirect_to band_url(@band)
        else
            render :edit
        end
    end
    def destroy
        @band = Band.find_by(id: params[:id])
        if @band.destroy
            redirect_to bands_url 
        else
            render json: @band.errors.full_messages, status: 403
        end
    end




    private
    def band_params 
        params.require(:band).permit(:name)
    end
end

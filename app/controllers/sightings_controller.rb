class SightingsController < ApplicationController
    def index 
        sightings = Sighting.where(date: params[:2022-12-13]..params[:2022-12-25])
        render json: sightings
    end
    def show 
        sighting = Sighting.find(params[:id])
        render json: sighting
    end
    def create 
        sighting = Sighting.create(animal_params)
        if sighting.valid?
            render json: sighting
        else 
            render json: sighting.errors
        end
    end
    def update 
        sighting = Sighting.find(params[:id])
        sighting.update(sighting_params)
        if sighting.valid?
            render json: sighting
        else 
            render json: sighting.errors
        end
    end

    def destroy 
        sighting = Sighting.find(params[:id])
        if sighting.destroy
            render json: sighting
        else
            render json: sighting.errors
        end
    end

    private 
    def sighting_params 
        params.require(:sighting).permit(:lattitude, :longitude, :date)
    end
end


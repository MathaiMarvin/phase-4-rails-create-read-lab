class PlantsController < ApplicationController

    def index
        render json: Plant.all
    end

    def show
        plant = Plant.find_by(id: params[:id])

        if plant
        render json: plant, status: :ok
        else
            render json: {error: "Plant Not Found"}, status: :not_found
        end
    end

    def create
        plant = Plant.create(plant_param)
        
        render json: plant, status: :created
    end

    private
    def plant_param
        params.permit(:name, :image, :price)
    end
end

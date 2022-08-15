module Api
    module V1
        class AirlinesController < ApplicationController

            protect_from_forgery with: :null_session
            
            def index
                airlines = Airline.all

                render json: AirlineBlueprint.render(airlines)
            end

            def create
                airline = Airline.new(airline_params)

                if airline.save
                    render json: AirlineBlueprint.render(airline, view: :show), status: 200
                else
                    head status: 304
                end
            end

            def show
                airline = Airline.find_by(slug: params[:slug])

                if airline
                    render json: AirlineBlueprint.render(airline, view: :show)
                else
                    head :no_content
                end
            end

            def destroy
                airline = Airline.find_by(slug: params[:slug])

                if airline.destroy
                    head :no_content
                end
            end

            def update
                airline = Airline.find_by(slug: params[:slug])

                if airline.update(airline_params)
                    render json: AirlineBlueprint.render(airline, view: :show), status: 200
                else
                    head status: 304
                end
            end

            def airline_params
                params.require(:airline).permit(:name, :image_url)
            end
        end
    end
end
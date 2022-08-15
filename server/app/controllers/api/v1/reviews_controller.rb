module Api
    module V1
        class ReviewsController < ApplicationController

            protect_from_forgery with: :null_session

            def create
                review = Review.new(review_params)

                if review.save!
                    render json: ReviewBlueprint.render(review)
                else
                    head :no_content
                end
            end

            def destroy
                review = Review.find(param[:id])

                if review.destroy
                    head :no_content
                end
            end

            private

            def review_params
                params.require(:review).permit(:title, :description, :score)
            end
        end
    end
end
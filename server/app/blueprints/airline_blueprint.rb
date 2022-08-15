class AirlineBlueprint < Blueprinter::Base
    identifier :id

    fields :name

    view :show do
        fields :image_url, :slug
        association :reviews, blueprint: ReviewBlueprint
    end
end
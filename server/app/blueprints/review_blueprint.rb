class ReviewBlueprint < Blueprinter::Base
    identifier :id

    fields :title, :score
end
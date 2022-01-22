module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :all_food, [Types::FoodType], null: false, description: 'Get all the food items.'

    def all_food
      Food.all
    end

    field :nutrition, [Types::NutritionType], null: false, description: 'Get all the nutrition facts.'

    def nutrition
      Nutrition.all
    end

    field :food, Types::FoodType, null: false do
      description 'Get a food item based on an id.'
      argument :id, ID, required: true
    end

    def food(id:)
      Food.find(id)
    end

    field :find_food, [Types::FoodType], null: false do
      description 'Find food types with a specific place of origin'
      argument :place_of_origin, String, required: true
    end

    def find_food(place_of_origin:)
      Food.where(place_of_origin: place_of_origin)
    end
  end
end

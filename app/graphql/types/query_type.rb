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
  end
end

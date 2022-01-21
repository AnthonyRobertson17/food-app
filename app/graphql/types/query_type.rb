module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :all_food, [Types::FoodType], null: false, description: 'Get all the food items.'

    def all_food
      Food.all
    end
  end
end

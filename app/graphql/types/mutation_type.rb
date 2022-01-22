module Types
  class MutationType < Types::BaseObject
    field :food_create, mutation: Mutations::FoodCreate
  end
end

# frozen_string_literal: true
module Types
  class MutationType < Types::BaseObject
    field :create_building, mutation: Mutations::CreateBuilding
    field :edit_building, mutation: Mutations::EditBuilding
  end
end

# frozen_string_literal: true

module Types
  class ClientType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :buildings, [Types::BuildingType], null: true
  end
end
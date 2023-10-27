# frozen_string_literal: true

module Mutations
  class CreateBuilding < BaseMutation
    argument :input, Types::Input::BuildingInputType, required: true

    field :building, Types::BuildingType, null: true
    field :errors, [String], null: false

    def resolve(input:)
      building = Building.new(
        client_id: input.client_id,
        address: input.address,
        state: input.state,
        zip: input.zip
      )

      if input.custom_fields.present?
        building.custom_fields.build(input.custom_fields.map(&:to_h))
      end

      if building.save
        {
          building: building,
          errors: [],
        }
      else
        # Error handling if the building could not be saved
        {
          building: nil,
          errors: building.errors.full_messages,
        }
      end
    end
  end
end

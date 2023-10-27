module Mutations
  class EditBuilding < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :client_id, ID, required: false
    argument :address, String, required: false
    argument :state, String, required: false
    argument :zip, String, required: false
    argument :custom_fields, [Types::Input::CustomFieldInputType], required: false

    field :building, Types::BuildingType, null: true
    field :errors, [String], null: false

    def resolve(id:, client_id: nil, address: nil, state: nil, zip: nil, custom_fields: nil)
      building = Building.find_by(id: id)

      if building
        # Update the building attributes
        if client_id
          client = Client.find_by(id: client_id)
          building.client = client
        end
        building.address = address if address
        building.state = state if state
        building.zip = zip if zip

        # Update custom fields if provided
        if custom_fields
          building.custom_fields.destroy_all # Clear existing custom fields
          custom_fields.each do |field|
            building.custom_fields.create(
              field_name: field.field_name,
              field_value: field.field_value,
              field_type: field.field_type
            )
          end
        end

        if building.save
          { building: building, errors: [] }
        else
          { building: nil, errors: building.errors.full_messages }
        end
      else
        { building: nil, errors: ["Building not found"] }
      end
    end
  end
end

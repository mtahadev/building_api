# frozen_string_literal: true

module Types
  module Input
    class BuildingInputType < Types::BaseInputObject
      argument :client_id, ID, required: true
      argument :address, String, required: true
      argument :state, String, required: true
      argument :zip, String, required: true
      argument :custom_fields, [Types::Input::CustomFieldInputType], required: false
    end
  end
end

# frozen_string_literal: true

module Types
  module Input
    class CustomFieldInputType < Types::BaseInputObject
      argument :field_type, String, required: true
      argument :field_name, String, required: true
      argument :field_value, String
    end
  end
end

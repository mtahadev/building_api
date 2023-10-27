# frozen_string_literal: true

module Types
  class CustomFieldType < Types::BaseObject
    field :id, ID, null: false
    field :field_name, String, null: false
    field :field_type, String, null: false
    field :field_value, String, null: true
  end
end

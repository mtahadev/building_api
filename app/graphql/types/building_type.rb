module Types
  class BuildingType < Types::BaseObject
    field :id, ID, null: false
    field :client, Types::ClientType, null: false
    field :address, String, null: false
    field :state, String, null: false
    field :zip, String, null: false
    field :client_name, String, null: false
    field :custom_fields, [Types::CustomFieldType], null: false

    def custom_fields
      object.custom_fields
    end
  end
end

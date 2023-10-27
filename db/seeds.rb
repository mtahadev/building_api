# Create 5 clients
5.times do |i|
  Client.create(name: "Client #{i + 1}")
end

clients = Client.all

# Seed buildings for each client with custom field values
clients.each do |client|
  # Sample buildings for each client
  3.times do |i|
    building = client.buildings.create(
      address: "Address #{i + 1}",
      state: "State #{i + 1}",
      zip: "Zip #{i + 1}"
    )
    # Set custom field values for the building
    building.custom_fields.create(field_name: "Number of Bathrooms", field_type: "number", field_value: (i + 1).to_s)
    building.custom_fields.create(field_name: "Number of Windows", field_type: "number", field_value: nil)
    building.custom_fields.create(field_name: "Pool", field_type: "boolean", field_value: "true")
    building.custom_fields.create(field_name: "Living Room Color", field_type: "freeform", field_value: "Blue")
    building.custom_fields.create(field_name: "Type of Walkway", field_type: "enum", field_value: "Brick")
  end
end

# GraphQL API Documentation

Welcome to the GraphQL API documentation for our Building Management System. This API allows you to interact with buildings, clients, and custom fields, offering powerful querying and mutation capabilities.

## Getting Started

To get started with this API, follow the steps below:

1. **Installation**:
   - Clone the repository to your local machine.
   - Run `bundle install` to install the required dependencies.

2. **Database Setup**:
   - Make sure you have a PostgreSQL database configured.
   - Update your `config/database.yml` file with your database settings.

3. **Database Migration**:
   - Run `rails db:migrate` to create the necessary database tables.

4. **Seed Data (Optional)**:
   - You can optionally run `rails db:seed` to populate the database with sample data.

5. **Starting the Server**:
   - Start the GraphQL server with `rails server`.

6. **Accessing the GraphiQL Interface**:
   - Open your browser and navigate to `http://localhost:3000/graphiql` to access the GraphiQL interface. This tool allows you to interact with the API using a user-friendly interface.

## GraphQL Queries

Here are some sample GraphQL queries you can use to retrieve data:

### Query for Buildings

```graphql
query {
  buildings {
    id
    client {
      name
    }
    address
    state
    zip
    customFields {
      fieldName
      fieldValue
    }
  }
}
```

### GraphQL Mutations

## Create a Building
```mutation CreateBuilding {
  createBuilding(
    input: {
      clientId: "1"
      address: "123 Main St"
      state: "New State"
      zip: "54321"
      customFields: [
        { fieldName: "field1", fieldValue: "value1", fieldType: "text" },
        { fieldName: "field2", fieldValue: "value2", fieldType: "number" }
      ]
    }
  ) {
    building {
      id
    }
    errors
  }
}
```

### Edit building

```mutation EditBuilding {
  editBuilding(
    input: {id: "1", clientId: "1", address: "Updated Address", state: "Updated State", zip: "54321", customFields: [
      {fieldName: "rock_wall_size", fieldValue: "20", fieldType: "number"},
      {fieldName: "rock_wall_length", fieldValue: "30", fieldType: "number"}
    ]}
  ) {
    building {
      id
      client {
        name
      }
      address
      state
      zip
      customFields {
        fieldName
        fieldValue
        fieldType
      }
    }
    errors
  }
}
```
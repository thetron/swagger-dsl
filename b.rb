{
  "openapi" => "3.0",
  "info" => {},
  "paths" => {
    "/users/{id}" => {
      "put" => {
        "operationId" => "UsersController#update",
        "parameters" => [
          { "name" => :id, "schema" => { "type" => :integer }, "required" => true, "in" => :path },
          { "name" => :safe, "schema" => { "type" => :boolean }, "in" => :query },
          {
            "name" => :redirect,
            "in" => :query,
            "required" => true,
            "schema" => { "type" => "string", "format" => "url" },
          },
        ],
        "requestBody" => {
          "description" => nil,
          "required" => true,
          "content" => { "application/json" => { "schema" => { "$ref" => "#/components/User" } } },
        },
        "responses" => {
          200 => {
            "content" => {
              "application/json" => {
                "schema" => {
                  "type" => "object",
                  "properties" => {
                    "status" => { "enum" => %w[ok], "default" => :ok, "type" => "string" },
                    "user" => { "$ref" => "#/components/User" },
                  },
                  "required" => %w[status user],
                  "additionalProperties" => false,
                },
              },
            },
          },
        },
      },
    },
  },
  "components" => {
    "User" => {
      "type" => "object",
      "properties" => {
        "id" => { "type" => "integer" },
        "name" => { "type" => "string" },
        "age" => { "minimum" => 18, "type" => "integer" },
      },
      "required" => %w[id name age],
      "title" => "User",
    },
  },
}
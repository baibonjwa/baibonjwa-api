module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :user, UserType, null: true do
      description 'Find a user by ID'
      argument :id, ID, required: true
    end

    def user(id:)
      User.find(id)
    end

    field :users, [UserType], null: true do
      description 'Find All users'
      argument :last, Integer, required: false
    end

    def users(last:)
      last ? User.last(last) : User.all
    end

    field :webgl_examples, [WebglExampleType], null: true do
      description 'Find All WebGL Examples'
      argument :last, Integer, required: false
    end

    def webgl_examples(last:)
      last ? WebglExample.last(last) : WebglExample.all
    end

    field :webgl_example, WebglExampleType, null: false do
      description 'Find a WebGL Examples by ID'
      argument :id, ID, required: true
    end

    def webgl_example(id:)
      WebglExample.find(id)
    end

  end
end

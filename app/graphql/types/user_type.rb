module Types
  class UserType < Types::BaseObject
    field :id, ID, null: true
    field :email, String, null: true
    field :name, String, null: true
    field :created_at, String, null: false
    field :updated_at, String, null: false
  end
end

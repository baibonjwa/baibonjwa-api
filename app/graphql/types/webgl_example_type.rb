module Types
  class WebglExampleType < Types::BaseObject
    description 'A WebGL Example'
    field :id, ID, null: false
    field :identifier, String, null: false
    field :name, String, null: false
    field :public_path, String, null: false
    field :description, String, null: true
  end
end

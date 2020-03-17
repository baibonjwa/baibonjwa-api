module Types
  class ArticleType < Types::BaseObject
    field :title, String, null: true
    field :content, String, null: false
    field :summary, String, null: false
    field :created_at, String, null: false
  end
end

# frozen_string_literal: true

# app/graphql/types/comment_type.rb
module Types
  # CommentType
  class CommentType < Types::BaseObject
    field :id, ID, null: false
    field :post, PostType, null: false
  end
end

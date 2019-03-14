module Types
  class LinkType < BaseObject
    field :id, ID, null: false
    field :url, String, null: false
    field :description, String, null: false
    field :votes, [Types::VoteType], null: false
    field :posted_by, UserType, null: true, method: :user
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end

module Types
  class LinkType < BaseObject
    field :id, ID, null: false
    field :created_at, DateTimeType, null: false
    field :url, String, null: false
    field :description, String, null: false
  end
end

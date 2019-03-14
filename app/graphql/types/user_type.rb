module Types
  class UserType < BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :email, String, null: false # Exposing `email` just beacause it doesn't matter here. A real application shouldn't leak user emails 
  end
end

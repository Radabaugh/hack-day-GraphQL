module Mutations
  class CreateLink < Mutations::BaseMutation
    # arguments passed to the `resolved` method
    argument :url, String, required: true
    argument :description, String, required: true

    # return type from the mutation
    type Types::LinkType

    def resolve( url: nil, description: nil)
      Link.create!(
        url: url,
        description: description,
        user: context[:current_user]
      )
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end

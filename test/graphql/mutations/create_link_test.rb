require 'test_helper'

class Mutations::CreateLinkTest < ActiveSupport::TestCase
  def perform_user(args = {})
    Mutations::CreateUser.new(object: nil, context: {}).resolve(args)
  end

  def perform(user: nil, **args)
    Mutations::CreateLink.new(object: nil, context: {:current_user => user}).resolve(args)
  end

  test 'create a new link' do
    user = perform_user(
      name: 'Test User',
      auth_provider: {
        email: {
          email: 'email@example.com',
          password: '[omitted]'
        }
      }
    )

    link = perform(
      url: 'http://example.com',
      description: 'description',
      user: user
    )

    assert link.persisted?
    assert_equal link.url, 'http://example.com'
    assert_equal link.description, 'description'
  end
end

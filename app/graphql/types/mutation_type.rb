# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_link, mutation: Mutations::CreateLink,
                        description: 'Mutation to create link'
    field :create_user, mutation: Mutations::CreateUser,
                        description: 'Mutation to create user'
  end
end

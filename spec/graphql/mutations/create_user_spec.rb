# frozen_string_literal: true

require 'rails_helper'

module Mutations
  RSpec.describe CreateUser, type: :request do
    def perform(name:, auth_provider:)
      Mutations::CreateUser.new(object: nil, field: nil, context: {}).resolve(name:, auth_provider:)
    end
    describe 'resolve' do
      it 'creates a user' do
        user = perform(
          name: 'Test User',
          auth_provider: {
            credentials: {
              email: 'email@example.com',
              password: '[omitted]'
            }
          }
        )
        expect(user.persisted?).to be(true)
        expect(user.email).to eq('email@example.com')
      end
    end
  end
end

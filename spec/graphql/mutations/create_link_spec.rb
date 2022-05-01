# frozen_string_literal: true

require 'rails_helper'

module Mutations
  RSpec.describe CreateLink, type: :request do
    def perform(url:, description:)
      Mutations::CreateLink.new(object: nil, field: nil, context: {}).resolve(url:, description:)
    end
    describe 'resolve' do
      let!(:link) do
        perform(
          url: 'http://example.com',
          description: 'description'
        )
      end

      it 'creates a link' do
        expect(link.persisted?).to be(true)
      end

      it 'returns the created link' do
        expect(link.url).to eq('http://example.com')
      end
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DocumentsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/documents').to route_to('documents#index')
    end

    it 'routes to #new' do
      expect(get: '/documents/new').to route_to('documents#new')
    end

    it 'routes to #show' do
      expect(get: '/documents/1').to route_to('documents#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/documents').to route_to('documents#create')
    end
  end
end

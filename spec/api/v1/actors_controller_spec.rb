# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::MoviesController, type: :request do
  let(:response_body) { JSON.parse(response.body, symbolize_names: true) }

  let(:headers) do
    { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }
  end

  describe 'GET api/actors' do
    def request
      get '/api/actors',
          headers: headers,
          xhr: true
    end

    context 'response structure' do
      before do
        PopulateEntities.call
        request
      end

      let(:json_schema) { Actors::SCHEMA }
      let(:items_number) { 5 }

      it_behaves_like 'successful_response_body'
    end
  end
end

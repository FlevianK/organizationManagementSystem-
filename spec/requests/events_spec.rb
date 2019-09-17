require 'rails_helper'

RSpec.describe 'Events API', type: :request do 
  let!(:events) { create_list(:event, 10) }
  let(:event_id) { events.first.id }

  describe 'GET /events' do
    before { get '/events' }

    it 'returns events' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /events/:id
  describe 'GET /events/:id' do
    before { get "/events/#{event_id}" }

    context 'when the record exists' do
      it 'returns the event' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(event_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:event_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Event/)
      end
    end
  end

  # Test suite for POST /events
  describe 'POST /events' do
    # valid payload
    let(:valid_attributes) { { department: 'Usher', event_date: 'Fri, 19 Sep 2020', event_name: 'youth  worship night', event_description: 'Heaven on earth experience night', event_guest:'Rose', event_venue: 'CMM' } }

    context 'when the request is valid' do
      
      before { post '/events', params: valid_attributes }

      it 'creates a event' do
        expect(json['department']).to eq('Usher')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/events', params: { department: 'Praise' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Event date can't be blank, Event name can't be blank, Event description can't be blank, Event guest can't be blank, Event venue can't be blank/)
      end
    end
  end

  # Test suite for PUT /events/:id
  describe 'PUT /events/:id' do
    let(:valid_attributes) { { Department: 'Praise' } }

    context 'when the record exists' do
      before { put "/events/#{event_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /events/:id
  describe 'DELETE /events/:id' do
    before { delete "/events/#{event_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
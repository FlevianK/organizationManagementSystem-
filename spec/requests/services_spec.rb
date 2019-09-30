require 'rails_helper'

RSpec.describe 'Services API', type: :request do 
  let!(:services) { create_list(:service, 10) }
  let(:service_id) { services.first.id }

  describe 'GET /services' do
    before { get '/services' }

    it 'returns services' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /services/:id
  describe 'GET /services/:id' do
    before { get "/services/#{service_id}" }

    context 'when the record exists' do
      it 'returns the service' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(service_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:service_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Service/)
      end
    end
  end

  # Test suite for POST /services
  describe 'POST /services' do
    # valid payload
    let(:valid_attributes) { { service: { service_date: 'Fri, 19 Sep 2020', total_new_converts: 34, total_attendants: 100, sunday_school_teachers:'Rose, CMM' } } }

    context 'when the request is valid' do
      
      before { post '/services', params: valid_attributes }

      it 'creates a service' do
        expect(json['total_new_converts']).to eq(34)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/services', params: {  service: { total_new_converts: 50 } } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Service date can't be blank, Total attendants can't be blank, Sunday school teachers can't be blank/)
      end
    end
  end

  # Test suite for PUT /services/:id
  describe 'PUT /services/:id' do
    let(:valid_attributes) { {  service: { total_new_converts: 20 } } }

    context 'when the record exists' do
      before { put "/services/#{service_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /services/:id
  describe 'DELETE /services/:id' do
    before { delete "/services/#{service_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
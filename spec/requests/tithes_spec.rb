require 'rails_helper'

RSpec.describe 'Tithes API', type: :request do 
  let!(:tithes) { create_list(:tithe, 10) }
  let(:tithe_id) { tithes.first.id }

  describe 'GET /tithes' do
    before { get '/tithes' }

    it 'returns tithes' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /tithes/:id
  describe 'GET /tithes/:id' do
    before { get "/tithes/#{tithe_id}" }

    context 'when the record exists' do
      it 'returns the tithe' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(tithe_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:tithe_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Tithe/)
      end
    end
  end

  # Test suite for POST /tithes
  describe 'POST /tithes' do
    # valid payload
    let(:valid_attributes) { { tithe: { name: 'Grace Joy', amount: 100, tithe_date: 'Fri, 19 Sep 2014', member: true, contacts: '2453' } } }

    context 'when the request is valid' do
      
      before { post '/tithes', params: valid_attributes }

      it 'creates a tithe' do
        expect(json['name']).to eq('Grace Joy')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/tithes', params: { tithe: { name: 'Jb k' } } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Member is not included in the list, Amount can't be blank, Tithe date can't be blank, Contacts can't be blank/)
      end
    end
  end

  # Test suite for PUT /tithes/:id
  describe 'PUT /tithes/:id' do
    let(:valid_attributes) { { tithe: { total_new_converts: 20 } } }

    context 'when the record exists' do
      before { put "/tithes/#{tithe_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /tithes/:id
  describe 'DELETE /tithes/:id' do
    before { delete "/tithes/#{tithe_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
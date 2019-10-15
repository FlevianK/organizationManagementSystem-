require 'rails_helper'

RSpec.describe 'Members API', type: :request do 
  let!(:members) { create_list(:member, 10) }
  let(:member_id) { members.first.id }
  # authorize request
  let(:user) { create(:user) }
  let(:headers) { valid_headers }

  describe 'GET /members' do
    before { get '/members', headers: headers }

    it 'returns members' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /members/:id
  describe 'GET /members/:id' do
    before { get "/members/#{member_id}", headers: headers }

    context 'when the record exists' do
      it 'returns the member' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(member_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:member_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Member/)
      end
    end
  end

  # Test suite for POST /members
  describe 'POST /members' do
    # valid payload
    let(:valid_attributes) { { member: { name: 'Praise Mary', contacts: '373', residence: 'Mirema', join_date: 'Fri, 19 Sep 2014', born_again: false, spirit_filled: false, departments: 'asher' } } }

    context 'when the request is valid' do
      
      before { post '/members', params: valid_attributes, headers: headers }

      it 'creates a member' do
        expect(json['name']).to eq('Praise Mary')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/members', params: { member: { name: 'Praise Pearl' } }, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Born again is not included in the list, Spirit filled is not included in the list, Contacts can't be blank, Residence can't be blank, Join date can't be blank, Departments can't be blank/)
      end
    end
  end

  # Test suite for PUT /members/:id
  describe 'PUT /mebers/:id' do
    let(:valid_attributes) { { member: { name: 'Praise Grace' } } }

    context 'when the record exists' do
      before { put "/members/#{member_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /members/:id
  describe 'DELETE /members/:id' do
    before { delete "/members/#{member_id}", headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
require 'rails_helper'

RSpec.describe 'Leaders API' do
  # Initialize the test data
  let!(:member) { create(:member) }
  let!(:leaders) { create_list(:leader, 20, member_id: member.id) }
  let(:member_id) { member.id }
  let(:id) { leaders.first.id }
  # authorize request
  let(:user) { create(:user) }
  let(:headers) { valid_headers }

  # Test suite for GET /members/:member_id/leaders
  describe 'GET /members/:member_id/leaders' do
    before { get "/members/#{member_id}/leaders", headers: headers }

    context 'when member exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all member who are leaders' do
        expect(json.size).to eq(20)
      end
    end

    context 'when member does not exist' do
      let(:member_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Member/)
      end
    end
  end

  # Test suite for GET /members/:member_id/leaders/:id
  describe 'GET /members/:member_id/leaders/:id' do
    before { get "/members/#{member_id}/leaders/#{id}", headers: headers }

    context 'when member who is a leader exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the leader' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when member but not a  leader exists' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Leader/)
      end
    end
  end

  # Test suite for POST /members/:member_id/leaders
  describe 'POST /members/:member_id/leaders' do
    let(:valid_attributes) { { leader: { title: 'chairperson', department: 'usher' } } }

    context 'when request attributes are valid' do
      before { post "/members/#{member_id}/leaders", params: valid_attributes, headers: headers }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/members/#{member_id}/leaders", params: { leader: {title: 'treasurer'} }, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Department can't be blank/)
      end
    end
  end

  # Test suite for PUT /members/:member_id/leaders/:id
  describe 'PUT /members/:member_id/leaders/:id' do
    let(:valid_attributes) { { leader: { title: 'Treasure' } } }

    before { put "/members/#{member_id}/leaders/#{id}", params: valid_attributes, headers: headers }

    context 'when the specific leader role for a member exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the leadership role' do
        updated_leader = Leader.find(id)
        expect(updated_leader.title).to match(/Treasure/)
      end
    end

    context 'when the specific leader role for a member does not exists' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Leader/)
      end
    end
  end

  # Test suite for DELETE /members/:id
  describe 'DELETE /members/:id' do
    before { delete "/members/#{member_id}/leaders/#{id}", headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
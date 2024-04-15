require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  # describe "GET /api/v1/users" do
  #   it "works! (now write some real specs)" do
  #     get api_v1_users_path
  #     expect(response).to have_http_status(200)
  #   end
  # end

  describe 'POST /api/v1/users' do
    let(:user_params) do
      { email: 'user@duetcode.io', password: 'samplepassword' }
    end

    it 'creates a new user' do
      post api_v1_users_path, params: { user: user_params }
      expected_body = { 'email' => 'user@duetcode.io' }

      expect(response).to have_http_status(:created)
      expect(load_body(response)['user']).to include(expected_body)
    end
  end
end

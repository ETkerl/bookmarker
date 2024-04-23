require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  # describe "GET /api/v1/users" do
  #   it "works! (now write some real specs)" do
  #     get api_v1_users_path
  #     expect(response).to have_http_status(200)
  #     puts(response)
  #   end
  # end

  describe 'POST /api/v1/users' do
    let(:user_params) do
      { email: 'user@duetcode.io', password: 'samplepassword' }
    end

    it 'creates a new user' do
      post api_v1_users_path, params: { user: user_params }
      expected_data = { 'email' => 'user@duetcode.io' }

      expect(response).to have_http_status(:created)

      parsed_response = load_body_data(response)

      expect(parsed_response).to include(expected_data)
    end

    it 'returns unprocessable entity with errors' do
      user_params[:password] = nil
      post api_v1_users_path, params: { user: user_params }

      expected_error = { 'password' => ['can\'t be blank'] }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(load_body_errors(response)).to eq(expected_error)
    end
    
  end
end

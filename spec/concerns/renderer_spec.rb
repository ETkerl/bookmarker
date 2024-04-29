# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Renderer, type: :controller do
  controller(ApplicationController) do
    include Renderer

    def show
      user = User.find(params[:id])
      # puts()
      options = { root: :json, status: :created }
      # puts(render_object(user, root: :json, status: :created))
      render_object(user, status: :created)
    end

    def create
      user = User.create(user_params)
      render_errors(user.errors)
    end

    private

    def user_params
      params.require(:user).permit(:email, :password)
    end
  end

  describe 'GET show' do
    let(:resource) { create(:user) }
    # let(:resource) { FactoryBot.create(:dummy, name: 'sample') }

    it 'renders resource with render_object method' do
      options = { root: :json, status: :created }
      get :show, params: { id: resource.id }

      # puts(load_body_data(response))

      data_fields = { 'id' => resource.id, 'email' => resource.email }
      # data_fields = { 'id' => resource.id, 'name' => resource.name }
      meta_fields = { 'resource' => 'User', 'count' => 1 }

      puts(load_body_data(response)['data'])

      expect(response.status).to eq(201)
      expect(load_body_data(response)).to include(data_fields)
      expect(load_body_meta(response)).to include(meta_fields)
    end
  end

  describe 'POST create' do
    it 'renders resource errors with render_errors method' do
      post :create, params: { user: { email: nil, password: nil } }
      # post :create, params: { dummy: { name: nil } }

      error_fields = {
        'email' => ['can\'t be blank'],
        'password' => ['can\'t be blank']
      }

      # error_fields = {
      #     'name' => ['can\'t be blank']
      # }

      expect(response.status).to eq(422)
      expect(load_body_errors(response)).to eq(error_fields)
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BaseSerializer, type: :serializer do
  let(:resource) { FactoryBot.create(:user) }
  let(:serialized_resource) { described_class.new(resource).as_json }

  subject { serialized_resource }

  it 'has an ID that matches with resource ID' do
    # puts(serialized_resource)
    # puts(resource)
    # puts(subject[:id])
    expect(subject[:id]).to eq(resource.id)
  end

  it 'has a created date time of the resource' do
    expect(subject[:created_at]).to eq(resource.created_at)
  end

  it 'has an updated date time of the resource' do
    expect(subject[:updated_at]).to eq(resource.updated_at)
  end
end

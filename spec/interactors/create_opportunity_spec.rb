require 'rails_helper'

RSpec.describe CreateOpportunity, type: :interactor do
  let(:client) { create(:client) }

  it 'creates a new opportunity successfully' do
    result = described_class.call(opportunity_params: {
      title: 'Ruby on Rails Developer',
      description: 'Lorem ipsum dolor',
      salary: 100000,
      client_id: client.id
    })

    expect(result).to be_success
    expect(result.opportunity).to be_persisted
  end

  it 'fails if required fields are missing' do
    result = described_class.call(opportunity_params: {
      title: nil,
      description: 'No title',
      salary: nil,
      client_id: client.id
    })

    expect(result).to be_failure
    expect(result.error).to include("can't be blank")
  end
end

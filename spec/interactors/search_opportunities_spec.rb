require 'rails_helper'

RSpec.describe SearchOpportunities, type: :interactor do
  let!(:client) { create(:client) }

  before do
    create(:opportunity, title: 'Backend Dev', client: client)
    create(:opportunity, title: 'Frontend Dev', client: client)
  end

  it 'returns all opportunities when no filters are given' do
    result = described_class.call(q: {}, page: 1, per_page: 10)
    expect(result).to be_success
    expect(result.opportunities.length).to eq(2)
  end

  it 'filters opportunities by title' do
    result = described_class.call(q: { title_cont: 'Backend' }, page: 1, per_page: 10)
    expect(result).to be_success
    expect(result.opportunities.length).to eq(1)
    expect(result.opportunities.first.title).to eq('Backend Dev')
  end
end

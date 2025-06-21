require 'rails_helper'

RSpec.describe ApplyOpportunity, type: :interactor do
  let!(:client) { create(:client) }
  let!(:opportunity) { create(:opportunity, client: client) }
  let!(:job_seeker) { create(:job_seeker) }

  it 'applies successfully to an opportunity' do
    result = described_class.call(opportunity_id: opportunity.id, job_seeker_id: job_seeker.id)
    expect(result).to be_success
    expect(result.application).to be_persisted
  end

  it 'fails if opportunity not found' do
    result = described_class.call(opportunity_id: -1, job_seeker_id: job_seeker.id)
    expect(result).to be_failure
    expect(result.error).to eq('Opportunity not found')
  end

  it 'fails if job seeker not found' do
    result = described_class.call(opportunity_id: opportunity.id, job_seeker_id: -1)
    expect(result).to be_failure
    expect(result.error).to eq('Job Seeker not found')
  end
end

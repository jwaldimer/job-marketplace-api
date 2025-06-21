require 'rails_helper'

RSpec.describe "Opportunities API", type: :request do
  describe "GET /opportunities" do
    it "returns the list of opportunities" do
      create_list(:opportunity, 3)
      get "/opportunities"
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end

  describe "POST /opportunities" do
    it "creates a new opportunity" do
      client = create(:client)
      post "/opportunities", params: {
        opportunity: {
          title: "Rails Dev",
          description: "Build stuff ans apis",
          salary: 95000,
          client_id: client.id
        }
      }, as: :json

      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)["title"]).to eq("Rails Dev")
    end
  end

  describe "POST /opportunities/:id/apply" do
    it "allows a job seeker to apply" do
      opportunity = create(:opportunity)
      job_seeker = create(:job_seeker)

      post "/opportunities/#{opportunity.id}/apply", params: {
        job_seeker_id: job_seeker.id
      }, as: :json

      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)["message"]).to eq("Application received")
    end
  end
end

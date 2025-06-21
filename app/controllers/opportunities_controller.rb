class OpportunitiesController < ApplicationController
  def index
    result = SearchOpportunities.call(
      q: params[:q],
      page: params[:page],
      per_page: params[:per_page]
    )

    render json: result.opportunities.as_json(include: { client: { only: :name } })
  end

  def create
    result = CreateOpportunity.call(opportunity_params: opportunity_params)

    if result.success?
      render json: result.opportunity, status: :created
    else
      render json: { error: result.error }, status: :unprocessable_entity
    end
  end

  def apply
    result = ApplyOpportunity.call(
      opportunity_id: params[:id],
      job_seeker_id: params[:job_seeker_id]
    )

    if result.success?
      render json: { message: "Application received" }, status: :created
    else
      render json: { error: result.error }, status: :unprocessable_entity
    end
  end

  private

  def opportunity_params
    params.require(:opportunity).permit(Opportunity::CREATE_PARAMS)
  end
end

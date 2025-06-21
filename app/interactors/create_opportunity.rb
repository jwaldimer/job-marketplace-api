class CreateOpportunity
  include Interactor

  def call
    opportunity = Opportunity.new(context.opportunity_params)

    return context.fail!(error: opportunity.errors.full_messages.join(", ")) unless opportunity.save

    context.opportunity = opportunity
  end
end

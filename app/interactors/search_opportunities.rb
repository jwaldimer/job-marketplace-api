class SearchOpportunities
  include Interactor

  def call
    search = Opportunity.ransack(context.q)
    opportunities = search.result.includes(:client)

    paginated = opportunities
      .page(context.page)
      .per(context.per_page || 10)

    context.opportunities = paginated
  end
end

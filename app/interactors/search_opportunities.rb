class SearchOpportunities
  include Interactor

  def call
    context.opportunities = Rails.cache.fetch(cache_key, expires_in: 5.minutes) do
      search = Opportunity.ransack(context.q)
      search.result.includes(:client).to_a
    end

    context.opportunities = Kaminari.paginate_array(context.opportunities)
                                     .page(context.page)
                                     .per(context.per_page || 10)
  end

  private

  def cache_key
    query = context.q.to_s.parameterize
    page = context.page || 1
    per = context.per_page || 10
    "opportunities:search:#{query}:page#{page}:per#{per}"
  end
end

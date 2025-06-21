class ApplyOpportunity
  include Interactor

  def call
    opportunity = Opportunity.find_by(id: context.opportunity_id)
    return context.fail!(error: "Opportunity not found") unless opportunity

    job_seeker = JobSeeker.find_by(id: context.job_seeker_id)
    return context.fail!(error: "Job Seeker not found") unless job_seeker

    application = JobApplication.new(
      opportunity: opportunity,
      job_seeker: job_seeker
    )

    return context.fail!(error: application.errors.full_messages.join(", ")) unless application.save

    NotifyApplicationWorker.perform_async(application.id)
    context.application = application
  end
end

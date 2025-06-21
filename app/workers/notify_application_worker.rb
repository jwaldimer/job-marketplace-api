class NotifyApplicationWorker
  include Sidekiq::Worker

  def perform(job_application_id)
    application = JobApplication.includes(:job_seeker, :opportunity).find(job_application_id)
    Rails.logger.info "Notification: #{application.job_seeker.name} applied to #{application.opportunity.title}"
  end
end

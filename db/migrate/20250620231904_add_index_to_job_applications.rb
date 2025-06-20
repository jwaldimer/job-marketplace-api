class AddIndexToJobApplications < ActiveRecord::Migration[8.0]
  def change
    add_index :job_applications, [ :job_seeker_id, :opportunity_id ], unique: true
  end
end

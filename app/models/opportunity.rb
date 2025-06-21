class Opportunity < ApplicationRecord
  belongs_to :client
  has_many :applications, class_name: "JobApplication"

  validates :title, :description, :salary, presence: true

  CREATE_PARAMS = %i[title description salary client_id].freeze

  def self.ransackable_attributes(auth_object = nil)
    %w[title description]
  end
end

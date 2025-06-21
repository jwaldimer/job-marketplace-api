class Client < ApplicationRecord
  has_many :opportunities

  def self.ransackable_attributes(auth_object = nil)
    %w[name last_name]
  end
end

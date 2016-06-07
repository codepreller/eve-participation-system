# frozen_string_literal: true
class Fleet < ActiveRecord::Base
  has_many :participations

  validates :name, :fc_name, :doctrin, :details, :duration, :hours, :minutes, presence: true

  def participating?(eve_charid)
    participations.find_by(eve_charid: eve_charid).present?
  end

  def expired?
    created_at < 20.minutes.ago
  end
end

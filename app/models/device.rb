require 'action_view'
require 'action_view/helpers'

class Device < ApplicationRecord
  include ActionView::Helpers::DateHelper

  validates :fcm_token, presence: true, uniqueness: true

  has_many :product_hits

  def time_ago
    return if last_usage_time.nil?

    distance_of_time_in_words_to_now(last_usage_time.to_datetime)
  end
end

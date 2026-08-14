# frozen_string_literal: true

require "active_support"
require "active_support/time" # ::ActiveSupport::TimeWithZone の定義元

require_relative "time_extension"

module ActiveSupport
  class TimeWithZone
    include ::Decentworks::DateSupport::TimeExtension
  end
end

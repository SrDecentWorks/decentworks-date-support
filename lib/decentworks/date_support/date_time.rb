# frozen_string_literal: true

require "date"
require "active_support/time"
require_relative "time_extension"

class ::DateTime
  include ::Decentworks::DateSupport::TimeExtension
end

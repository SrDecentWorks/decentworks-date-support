# frozen_string_literal: true

require "time"
require "active_support/time"
require_relative "time_extension"

class ::Time
  include ::Decentworks::DateSupport::TimeExtension
end

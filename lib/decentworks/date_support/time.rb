# frozen_string_literal: true

require_relative "time_extension"

class ::Time
  include ::Decentworks::DateSupport::TimeExtension
end

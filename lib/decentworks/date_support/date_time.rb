# frozen_string_literal: true

require "date" # ::DateTime の定義元

require_relative "time_extension"

class ::DateTime
  include ::Decentworks::DateSupport::TimeExtension
end

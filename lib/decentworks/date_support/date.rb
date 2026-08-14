# frozen_string_literal: true

require "date" # ::Date の定義元

require_relative "date_extension"

class ::Date
  include ::Decentworks::DateSupport::DateExtension
end

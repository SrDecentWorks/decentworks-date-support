# frozen_string_literal: true

require "faker"

require "simplecov"
SimpleCov.start

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before do
    ::Decentworks::DateSupport.configure do |config|
      config.beginning_of_first_quarter = :january
    end
  end

  config.after do
    ::Decentworks::DateSupport.reset_configuration!
  end
end

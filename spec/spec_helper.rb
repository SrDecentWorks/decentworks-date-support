# frozen_string_literal: true

require "date"

require "active_support"
require "active_support/core_ext"
require "active_support/time"

require "simplecov"
SimpleCov.start do
  add_filter "/spec/"

  enable_coverage :branch

  minimum_coverage line: 100, branch: 100
end

require "decentworks/date_support"

::Dir[::File.expand_path("support/**/*.rb", __dir__)].each { |file| require file }

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before do
    ::Time.zone = "Asia/Tokyo"
    ::Date.beginning_of_week = :monday # 週は月曜日始まり

    # 第1四半期（上期）の開始月の指定
    ::Decentworks::DateSupport.configure do |config|
      config.beginning_of_first_quarter = :january
    end
  end

  config.after do
    # 第1四半期（上期）の開始月の初期化
    ::Decentworks::DateSupport.reset_configuration!
  end
end

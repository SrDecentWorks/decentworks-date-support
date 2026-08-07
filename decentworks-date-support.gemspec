# frozen_string_literal: true

require_relative "lib/decentworks/date/support/version"

Gem::Specification.new do |spec|
  spec.name = "decentworks-date-support"
  spec.version = Decentworks::Date::Support::VERSION
  spec.authors = ["decentworks"]
  spec.email = [""]

  spec.summary = "日付機能拡張ライブラリ"
  spec.description = "日付機能拡張ライブラリ"
  spec.homepage = "https://github.com/YutakaMizomoto/decentworks-date-support"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 4.0.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/YutakaMizomoto/decentworks-date-support"
  spec.metadata["changelog_uri"] = "https://github.com/SrDecentWorks/decentworks-date-support/blob/develop/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_development_dependency "activesupport", "~> 8.1"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end

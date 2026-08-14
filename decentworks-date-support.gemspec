# frozen_string_literal: true

require_relative "lib/decentworks/date_support/version"

Gem::Specification.new do |spec|
  spec.name = "decentworks-date-support"
  spec.version = ::Decentworks::DateSupport::VERSION
  spec.authors = [ "decentworks" ]
  spec.email = [ "yutaka.mizomoto@sr-decentworks.com" ]

  spec.summary = "日付機能拡張ライブラリ"
  spec.description = "日付機能拡張ライブラリ"
  spec.homepage = "https://github.com/SrDecentWorks/decentworks-date-support/tree/main"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 4.0.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/SrDecentWorks/decentworks-date-support/blob/main/CHANGELOG.md"
  # gem pushに多要素認証を必須にする
  spec.metadata["rubygems_mfa_required"] = "true"

  # gemに含めるファイル
  #
  # 除外の指定漏れで開発用ファイルが同梱されることを避けるため、ホワイトリストで指定する。
  # 対象は実装（lib）・型定義（sig）・実行ファイル（exe）とドキュメントのみ。
  # spec / bin / Rakefile / Gemfile / gemspec、および .claude .rubocop.yml .ruby-version .rspec
  # Steepfile rbs_collection*.yaml CODE_OF_CONDUCT.md などの開発用ファイルは含めない。
  distributed_files = %w[README.md CHANGELOG.md LICENSE]
  distributed_directories = %w[lib/ sig/ exe/]
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).select do |f|
      distributed_files.include?(f) || f.start_with?(*distributed_directories)
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = [ "lib" ]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_dependency "activesupport", "~> 8.1"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end

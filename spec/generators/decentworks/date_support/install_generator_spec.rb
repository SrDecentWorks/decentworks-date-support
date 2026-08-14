# frozen_string_literal: true

require "fileutils"

require "rails/generators"

require "spec_helper"
require "decentworks/date_support/configuration"
require "generators/decentworks/date_support/install/install_generator"

RSpec.describe ::Decentworks::DateSupport::Generators::InstallGenerator do
  subject(:initializer) { ::File.read(initializer_path) }

  let(:destination_root) { ::File.expand_path("../../../../tmp/generators", __dir__) }
  let(:initializer_path) do
    ::File.join(destination_root, "config/initializers/decentworks_date_support.rb")
  end

  before do
    ::FileUtils.rm_rf(destination_root)
    described_class.start(args, destination_root:, shell: ::Thor::Shell::Basic.new)
  end

  after { ::FileUtils.rm_rf(destination_root) }

  context "オプション指定なし（初期値）" do
    let(:args) { [] }

    it { expect(::File).to exist(initializer_path) }

    it { is_expected.to include "::Decentworks::DateSupport.configure do |config|" }

    it { is_expected.to include "config.first_quarter_month_name = :january" }
  end
end

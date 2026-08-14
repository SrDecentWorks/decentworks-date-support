# frozen_string_literal: true

require "spec_helper"
require "open3"

# gem 単体で読み込んだ場合の依存関係
#
# spec_helper が事前に active_support を読み込んでしまうため、別プロセスで検証する。
RSpec.describe "decentworks/date_support" do
  subject(:execution) { ::Open3.capture3(::RbConfig.ruby, "-I", lib_path, "-e", script) }

  let(:lib_path) { ::File.expand_path("../../lib", __dir__) }

  context "active_supportを事前にrequireしていない場合" do
    let(:script) do
      <<~RUBY
        require "decentworks/date_support"

        print ::Date.new(2026, 8, 5).all_this_week.to_s
      RUBY
    end

    it "週関係のメソッドが動作する" do
      stdout, stderr, status = execution

      expect(stderr).to eq ""
      expect(status).to be_success
      expect(stdout).to eq "2026-08-03..2026-08-09"
    end
  end

  context "gem名でrequireした場合" do
    let(:script) do
      <<~RUBY
        require "decentworks-date-support"

        print ::Date.new(2026, 8, 5).beginning_of_first_quarter.to_s
      RUBY
    end

    it "四半期関係のメソッドが動作する" do
      stdout, stderr, status = execution

      expect(stderr).to eq ""
      expect(status).to be_success
      expect(stdout).to eq "2026-01-01"
    end
  end

  context "個別のファイルのみrequireした場合" do
    let(:script) do
      <<~RUBY
        require "decentworks/date_support/time"

        print ::Time.new(2026, 8, 5, 12, 34, 56, "+09:00").beginning_of_january.to_s
      RUBY
    end

    it "対象クラスの拡張が有効になる" do
      stdout, stderr, status = execution

      expect(stderr).to eq ""
      expect(status).to be_success
      expect(stdout).to eq "2026-01-01 00:00:00 +0900"
    end
  end
end

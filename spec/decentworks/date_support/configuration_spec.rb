# frozen_string_literal: true

require "spec_helper"

RSpec.describe ::Decentworks::DateSupport do
  # ###################################################################################################################
  # configureが未実行の場合
  # ###################################################################################################################

  context "configureが未実行の場合" do
    before { described_class.reset_configuration! }

    describe ".configuration" do
      subject { described_class.configuration }

      it { is_expected.to be_a ::Decentworks::DateSupport::Configuration }

      it "例外を発生させない" do
        expect { described_class.configuration }.not_to raise_error
      end
    end

    describe ".beginning_of_first_quarter" do
      subject { described_class.beginning_of_first_quarter }

      it { is_expected.to eq ::Decentworks::DateSupport::Configuration::DEFAULT }
      it { is_expected.to eq :january }
    end

    describe ".beginning_of_first_quarter_month" do
      subject { described_class.beginning_of_first_quarter_month }

      it { is_expected.to eq 1 }
    end

    describe ".first_quarter_month_offset" do
      subject { described_class.first_quarter_month_offset }

      it { is_expected.to eq 0 }
    end

    describe "::Dateの四半期メソッド" do
      subject { ::Date.new(2026, 8, 5).beginning_of_first_quarter }

      it { is_expected.to eq ::Date.new(2026, 1, 1) }
    end

    describe "::ActiveSupport::TimeWithZoneの四半期メソッド" do
      subject { ::Time.zone.local(2026, 8, 5, 12, 34, 56).beginning_of_first_quarter }

      it { is_expected.to eq ::Time.zone.local(2026, 1, 1).beginning_of_day }
    end
  end

  # ###################################################################################################################
  # configureが実行済みの場合
  # ###################################################################################################################

  context "configureが実行済みの場合" do
    before do
      described_class.reset_configuration!
      described_class.configure { |config| config.beginning_of_first_quarter = :april }
    end

    describe ".beginning_of_first_quarter" do
      subject { described_class.beginning_of_first_quarter }

      it { is_expected.to eq :april }
    end

    describe ".configure" do
      it "同一のConfigurationインスタンスを保持する" do
        expect { described_class.configure }.not_to change(described_class, :configuration)
      end

      it "ブロックなしで呼び出しても設定を破棄しない" do
        described_class.configure

        expect(described_class.beginning_of_first_quarter).to eq :april
      end
    end

    describe ".reset_configuration!" do
      it "初期値に戻る" do
        described_class.reset_configuration!

        expect(described_class.beginning_of_first_quarter).to eq :january
      end
    end
  end
end

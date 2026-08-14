# frozen_string_literal: true

require "spec_helper"

RSpec.describe ::Decentworks::DateSupport do
  # ###################################################################################################################
  # モジュールのAPI
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

      it { expect(described_class.reset_configuration!).to be_nil }
    end
  end

  # ###################################################################################################################
  # Configuration
  # ###################################################################################################################

  describe ::Decentworks::DateSupport::Configuration do
    subject(:configuration) { described_class.new }

    let(:all_months) do
      %i[january february march april may june july august september october november december]
    end

    describe "::MONTHS" do
      subject { described_class::MONTHS }

      it { is_expected.to be_frozen }
      it { is_expected.to eq all_months.each_with_index.to_h { |name, index| [ name, index + 1 ] } }
      it { expect(subject.size).to eq 12 }
    end

    describe "::DEFAULT" do
      subject { described_class::DEFAULT }

      it { is_expected.to eq :january }
      it { expect(described_class::MONTHS).to have_key(subject) }
    end

    describe "#beginning_of_first_quarter" do
      subject { configuration.beginning_of_first_quarter }

      it { is_expected.to eq described_class::DEFAULT }
    end

    describe "#beginning_of_first_quarter=" do
      context "有効な月名を指定した場合" do
        it "12ヶ月すべてを設定できる" do
          all_months.each do |month|
            configuration.beginning_of_first_quarter = month

            expect(configuration.beginning_of_first_quarter).to eq month
          end
        end
      end

      context "無効な値を指定した場合" do
        [ :foo, "january", nil, 1, :JANUARY ].each do |invalid|
          context "#{invalid.inspect}の場合" do
            it { expect { configuration.beginning_of_first_quarter = invalid }.to raise_error(::ArgumentError) }

            it "指定された値をメッセージに含む" do
              expect { configuration.beginning_of_first_quarter = invalid }
                .to raise_error(::ArgumentError, /#{::Regexp.escape(invalid.inspect)}/)
            end

            it "設定値を変更しない" do
              expect { configuration.beginning_of_first_quarter = invalid }.to raise_error(::ArgumentError)

              expect(configuration.beginning_of_first_quarter).to eq described_class::DEFAULT
            end
          end
        end
      end
    end

    describe "#beginning_of_first_quarter_month" do
      it "月名に対応する月数を返す" do
        all_months.each_with_index do |month, index|
          configuration.beginning_of_first_quarter = month

          expect(configuration.beginning_of_first_quarter_month).to eq(index + 1)
        end
      end
    end

    describe "#first_quarter_month_offset" do
      it "1月始まりとのずれを返す" do
        all_months.each_with_index do |month, index|
          configuration.beginning_of_first_quarter = month

          expect(configuration.first_quarter_month_offset).to eq index
        end
      end
    end
  end
end

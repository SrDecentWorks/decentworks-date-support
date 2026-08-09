# frozen_string_literal: true

require "date"

require "active_support"
require "active_support/core_ext"
require "active_support/time"

require "spec_helper"
require "decentworks/date_support"
require "decentworks/date_support/configuration"

RSpec.describe ::Decentworks::DateSupport do
  using ::Decentworks::DateSupport

  let(:instance) { ::Date.new(2026, 8, 5) }

  before do
    ::Date.beginning_of_week = :monday # 週は月曜日始まり
  end

  # ###################################################################################################################
  # 週関係
  # ###################################################################################################################

  describe "#beginning_of_this_week" do
    subject { instance.beginning_of_this_week }

    it { is_expected.to eq ::Date.new(2026, 8, 3) }
  end

  describe "#end_of_this_week" do
    subject { instance.end_of_this_week }

    it { is_expected.to eq ::Date.new(2026, 8, 9) }
  end

  describe "#all_this_week" do
    subject { instance.all_this_week }

    it { is_expected.to eq ::Range.new(::Date.new(2026, 8, 3), ::Date.new(2026, 8, 9)) }
  end

  # ###################################################################################################################
  # 月関係
  # ###################################################################################################################

  describe "#all_this_month" do
    subject { instance.all_this_month }

    it { is_expected.to eq ::Range.new(::Date.new(2026, 8, 1), ::Date.new(2026, 8, 31)) }
  end

  describe "#two_months_ago" do
    subject { instance.two_months_ago }

    it { is_expected.to eq ::Date.new(2026, 6, 5) }
  end

  describe "#three_months_ago" do
    subject { instance.three_months_ago }

    it { is_expected.to eq ::Date.new(2026, 5, 5) }
  end

  describe "#four_months_ago" do
    subject { instance.four_months_ago }

    it { is_expected.to eq ::Date.new(2026, 4, 5) }
  end

  describe "#five_months_ago" do
    subject { instance.five_months_ago }

    it { is_expected.to eq ::Date.new(2026, 3, 5) }
  end

  describe "#six_months_ago" do
    subject { instance.six_months_ago }

    it { is_expected.to eq ::Date.new(2026, 2, 5) }
  end

  describe "#half_year_ago" do
    subject { instance.half_year_ago }

    it { is_expected.to eq ::Date.new(2026, 2, 5) }
  end

  describe "#seven_months_ago" do
    subject { instance.seven_months_ago }

    it { is_expected.to eq ::Date.new(2026, 1, 5) }
  end

  describe "#eight_months_ago" do
    subject { instance.eight_months_ago }

    it { is_expected.to eq ::Date.new(2025, 12, 5) }
  end

  describe "#nine_months_ago" do
    subject { instance.nine_months_ago }

    it { is_expected.to eq ::Date.new(2025, 11, 5) }
  end

  describe "#ten_months_ago" do
    subject { instance.ten_months_ago }

    it { is_expected.to eq ::Date.new(2025, 10, 5) }
  end

  describe "#eleven_months_ago" do
    subject { instance.eleven_months_ago }

    it { is_expected.to eq ::Date.new(2025, 9, 5) }
  end

  describe "#two_months_since" do
    subject { instance.two_months_since }

    it { is_expected.to eq ::Date.new(2026, 10, 5) }
  end

  describe "#three_months_since" do
    subject { instance.three_months_since }

    it { is_expected.to eq ::Date.new(2026, 11, 5) }
  end

  describe "#four_months_since" do
    subject { instance.four_months_since }

    it { is_expected.to eq ::Date.new(2026, 12, 5) }
  end

  describe "#five_months_since" do
    subject { instance.five_months_since }

    it { is_expected.to eq ::Date.new(2027, 1, 5) }
  end

  describe "#six_months_since" do
    subject { instance.six_months_since }

    it { is_expected.to eq ::Date.new(2027, 2, 5) }
  end

  describe "#half_year_since" do
    subject { instance.half_year_since }

    it { is_expected.to eq ::Date.new(2027, 2, 5) }
  end

  describe "#seven_months_since" do
    subject { instance.seven_months_since }

    it { is_expected.to eq ::Date.new(2027, 3, 5) }
  end

  describe "#eight_months_since" do
    subject { instance.eight_months_since }

    it { is_expected.to eq ::Date.new(2027, 4, 5) }
  end

  describe "#nine_months_since" do
    subject { instance.nine_months_since }

    it { is_expected.to eq ::Date.new(2027, 5, 5) }
  end

  describe "#ten_months_since" do
    subject { instance.ten_months_since }

    it { is_expected.to eq ::Date.new(2027, 6, 5) }
  end

  describe "#eleven_months_since" do
    subject { instance.eleven_months_since }

    it { is_expected.to eq ::Date.new(2027, 7, 5) }
  end

  #
  # 1月
  #

  describe "#beginning_of_january" do
    subject { instance.beginning_of_january }

    it { is_expected.to eq ::Date.new(2026, 1, 1) }
  end

  describe "#end_of_january" do
    subject { instance.end_of_january }

    it { is_expected.to eq ::Date.new(2026, 1, 31) }
  end

  describe "#all_january" do
    subject { instance.all_january }

    let(:beginning_of_january) { instance.beginning_of_january }
    let(:end_of_january) { instance.end_of_january }

    it { is_expected.to eq ::Range.new(beginning_of_january, end_of_january) }
  end

  describe "#beginning_of_january?" do
    subject { instance.beginning_of_january? }

    context "月初" do
      let(:instance) { ::Date.new(2026, 1, 1) }

      it { is_expected.to be_truthy }
    end

    context "月初以外" do
      let(:instance) { ::Date.new(2026, 1, 2) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#end_of_january?" do
    subject { instance.end_of_january? }

    context "月末" do
      let(:instance) { ::Date.new(2026, 1, 31) }

      it { is_expected.to be_truthy }
    end

    context "月末以外" do
      let(:instance) { ::Date.new(2026, 2, 1) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#in_january?" do
    subject { instance.in_january? }

    context "1月ではない（前月月末）" do
      let(:instance) { ::Date.new(2025, 12, 31) }

      it { is_expected.to be_falsey }
    end

    context "1月月初" do
      let(:instance) { ::Date.new(2026, 1, 1) }

      it { is_expected.to be_truthy }
    end

    context "1月中旬" do
      let(:instance) { ::Date.new(2026, 1, 15) }

      it { is_expected.to be_truthy }
    end

    context "1月月末" do
      let(:instance) { ::Date.new(2026, 1, 31) }

      it { is_expected.to be_truthy }
    end

    context "1月ではない（翌月月初）" do
      let(:instance) { ::Date.new(2026, 2, 1) }

      it { is_expected.to be_falsey }
    end
  end

  #
  # 2月
  #

  describe "#beginning_of_february" do
    subject { instance.beginning_of_february }

    it { is_expected.to eq ::Date.new(2026, 2, 1) }
  end

  describe "#end_of_february" do
    subject { instance.end_of_february }

    context "平年（閏年ではない）" do
      it { is_expected.to eq ::Date.new(2026, 2, 28) }
    end

    context "閏年" do
      let(:instance) { ::Date.new(2028, 8, 5) }

      it { is_expected.to eq ::Date.new(2028, 2, 29) }
    end
  end

  describe "#all_february" do
    subject { instance.all_february }

    let(:beginning_of_february) { instance.beginning_of_february }
    let(:end_of_february) { instance.end_of_february }

    it { is_expected.to eq ::Range.new(beginning_of_february, end_of_february) }
  end

  describe "#beginning_of_february?" do
    subject { instance.beginning_of_february? }

    context "月初" do
      let(:instance) { ::Date.new(2026, 2, 1) }

      it { is_expected.to be_truthy }
    end

    context "月初以外" do
      let(:instance) { ::Date.new(2026, 2, 2) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#end_of_february?" do
    subject { instance.end_of_february? }

    context "月末" do
      let(:instance) { ::Date.new(2026, 2, 28) }

      it { is_expected.to be_truthy }
    end

    context "月末以外" do
      let(:instance) { ::Date.new(2026, 3, 1) }

      it { is_expected.to be_falsey }
    end

    context "閏年" do
      context "月末以外（2月）" do
        let(:instance) { ::Date.new(2028, 2, 28) }

        it { is_expected.to be_falsey }
      end

      context "月末" do
        let(:instance) { ::Date.new(2028, 2, 29) }

        it { is_expected.to be_truthy }
      end

      context "月末以外（3月）" do
        let(:instance) { ::Date.new(2028, 3, 1) }

        it { is_expected.to be_falsey }
      end
    end
  end

  describe "#in_february?" do
    subject { instance.in_february? }

    context "2月ではない（前月月末）" do
      let(:instance) { ::Date.new(2026, 1, 31) }

      it { is_expected.to be_falsey }
    end

    context "2月月初" do
      let(:instance) { ::Date.new(2026, 2, 1) }

      it { is_expected.to be_truthy }
    end

    context "2月中旬" do
      let(:instance) { ::Date.new(2026, 2, 15) }

      it { is_expected.to be_truthy }
    end

    context "2月月末" do
      let(:instance) { ::Date.new(2026, 2, 28) }

      it { is_expected.to be_truthy }
    end

    context "2月ではない（翌月月初）" do
      let(:instance) { ::Date.new(2026, 3, 1) }

      it { is_expected.to be_falsey }
    end
  end

  #
  # 3月
  #

  describe "#beginning_of_march" do
    subject { instance.beginning_of_march }

    it { is_expected.to eq ::Date.new(2026, 3, 1) }
  end

  describe "#end_of_march" do
    subject { instance.end_of_march }

    it { is_expected.to eq ::Date.new(2026, 3, 31) }
  end

  describe "#all_march" do
    subject { instance.all_march }

    let(:beginning_of_march) { instance.beginning_of_march }
    let(:end_of_march) { instance.end_of_march }

    it { is_expected.to eq ::Range.new(beginning_of_march, end_of_march) }
  end

  describe "#beginning_of_march?" do
    subject { instance.beginning_of_march? }

    context "月初" do
      let(:instance) { ::Date.new(2026, 3, 1) }

      it { is_expected.to be_truthy }
    end

    context "月初以外" do
      let(:instance) { ::Date.new(2026, 3, 2) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#end_of_march?" do
    subject { instance.end_of_march? }

    context "月末" do
      let(:instance) { ::Date.new(2026, 3, 31) }

      it { is_expected.to be_truthy }
    end

    context "月末以外" do
      let(:instance) { ::Date.new(2026, 4, 1) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#in_march?" do
    subject { instance.in_march? }

    context "3月ではない（前月月末）" do
      let(:instance) { ::Date.new(2026, 2, 28) }

      it { is_expected.to be_falsey }
    end

    context "3月月初" do
      let(:instance) { ::Date.new(2026, 3, 1) }

      it { is_expected.to be_truthy }
    end

    context "3月中旬" do
      let(:instance) { ::Date.new(2026, 3, 15) }

      it { is_expected.to be_truthy }
    end

    context "3月月末" do
      let(:instance) { ::Date.new(2026, 3, 31) }

      it { is_expected.to be_truthy }
    end

    context "3月ではない（翌月月初）" do
      let(:instance) { ::Date.new(2026, 4, 1) }

      it { is_expected.to be_falsey }
    end
  end

  #
  # 4月
  #

  describe "#beginning_of_april" do
    subject { instance.beginning_of_april }

    it { is_expected.to eq ::Date.new(2026, 4, 1) }
  end

  describe "#end_of_april" do
    subject { instance.end_of_april }

    it { is_expected.to eq ::Date.new(2026, 4, 30) }
  end

  describe "#all_april" do
    subject { instance.all_april }

    let(:beginning_of_april) { instance.beginning_of_april }
    let(:end_of_april) { instance.end_of_april }

    it { is_expected.to eq ::Range.new(beginning_of_april, end_of_april) }
  end

  describe "#beginning_of_april?" do
    subject { instance.beginning_of_april? }

    context "月初" do
      let(:instance) { ::Date.new(2026, 4, 1) }

      it { is_expected.to be_truthy }
    end

    context "月初以外" do
      let(:instance) { ::Date.new(2026, 4, 2) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#end_of_april?" do
    subject { instance.end_of_april? }

    context "月末" do
      let(:instance) { ::Date.new(2026, 4, 30) }

      it { is_expected.to be_truthy }
    end

    context "月末以外" do
      let(:instance) { ::Date.new(2026, 5, 1) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#in_april?" do
    subject { instance.in_april? }

    context "4月ではない（前月月末）" do
      let(:instance) { ::Date.new(2026, 3, 31) }

      it { is_expected.to be_falsey }
    end

    context "4月月初" do
      let(:instance) { ::Date.new(2026, 4, 1) }

      it { is_expected.to be_truthy }
    end

    context "4月中旬" do
      let(:instance) { ::Date.new(2026, 4, 15) }

      it { is_expected.to be_truthy }
    end

    context "4月月末" do
      let(:instance) { ::Date.new(2026, 4, 30) }

      it { is_expected.to be_truthy }
    end

    context "4月ではない（翌月月初）" do
      let(:instance) { ::Date.new(2026, 5, 1) }

      it { is_expected.to be_falsey }
    end
  end

  #
  # 5月
  #

  describe "#beginning_of_may" do
    subject { instance.beginning_of_may }

    it { is_expected.to eq ::Date.new(2026, 5, 1) }
  end

  describe "#end_of_may" do
    subject { instance.end_of_may }

    it { is_expected.to eq ::Date.new(2026, 5, 31) }
  end

  describe "#all_may" do
    subject { instance.all_may }

    let(:beginning_of_may) { instance.beginning_of_may }
    let(:end_of_may) { instance.end_of_may }

    it { is_expected.to eq ::Range.new(beginning_of_may, end_of_may) }
  end

  describe "#beginning_of_may?" do
    subject { instance.beginning_of_may? }

    context "月初" do
      let(:instance) { ::Date.new(2026, 5, 1) }

      it { is_expected.to be_truthy }
    end

    context "月初以外" do
      let(:instance) { ::Date.new(2026, 5, 2) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#end_of_may?" do
    subject { instance.end_of_may? }

    context "月末" do
      let(:instance) { ::Date.new(2026, 5, 31) }

      it { is_expected.to be_truthy }
    end

    context "月末以外" do
      let(:instance) { ::Date.new(2026, 6, 1) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#in_may?" do
    subject { instance.in_may? }

    context "5月ではない（前月月末）" do
      let(:instance) { ::Date.new(2026, 4, 30) }

      it { is_expected.to be_falsey }
    end

    context "5月月初" do
      let(:instance) { ::Date.new(2026, 5, 1) }

      it { is_expected.to be_truthy }
    end

    context "5月中旬" do
      let(:instance) { ::Date.new(2026, 5, 15) }

      it { is_expected.to be_truthy }
    end

    context "5月月末" do
      let(:instance) { ::Date.new(2026, 5, 30) }

      it { is_expected.to be_truthy }
    end

    context "5月ではない（翌月月初）" do
      let(:instance) { ::Date.new(2026, 6, 1) }

      it { is_expected.to be_falsey }
    end
  end

  #
  # 6月
  #

  describe "#beginning_of_june" do
    subject { instance.beginning_of_june }

    it { is_expected.to eq ::Date.new(2026, 6, 1) }
  end

  describe "#end_of_june" do
    subject { instance.end_of_june }

    it { is_expected.to eq ::Date.new(2026, 6, 30) }
  end

  describe "#all_june" do
    subject { instance.all_june }

    let(:beginning_of_june) { instance.beginning_of_june }
    let(:end_of_june) { instance.end_of_june }

    it { is_expected.to eq ::Range.new(beginning_of_june, end_of_june) }
  end

  describe "#beginning_of_june?" do
    subject { instance.beginning_of_june? }

    context "月初" do
      let(:instance) { ::Date.new(2026, 6, 1) }

      it { is_expected.to be_truthy }
    end

    context "月初以外" do
      let(:instance) { ::Date.new(2026, 6, 2) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#end_of_june?" do
    subject { instance.end_of_june? }

    context "月末" do
      let(:instance) { ::Date.new(2026, 6, 30) }

      it { is_expected.to be_truthy }
    end

    context "月末以外" do
      let(:instance) { ::Date.new(2026, 7, 1) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#in_june?" do
    subject { instance.in_june? }

    context "6月ではない（前月月末）" do
      let(:instance) { ::Date.new(2026, 5, 31) }

      it { is_expected.to be_falsey }
    end

    context "6月月初" do
      let(:instance) { ::Date.new(2026, 6, 1) }

      it { is_expected.to be_truthy }
    end

    context "6月中旬" do
      let(:instance) { ::Date.new(2026, 6, 15) }

      it { is_expected.to be_truthy }
    end

    context "6月月末" do
      let(:instance) { ::Date.new(2026, 6, 30) }

      it { is_expected.to be_truthy }
    end

    context "6月ではない（翌月月初）" do
      let(:instance) { ::Date.new(2026, 7, 1) }

      it { is_expected.to be_falsey }
    end
  end

  #
  # 7月
  #

  describe "#beginning_of_july" do
    subject { instance.beginning_of_july }

    it { is_expected.to eq ::Date.new(2026, 7, 1) }
  end

  describe "#end_of_july" do
    subject { instance.end_of_july }

    it { is_expected.to eq ::Date.new(2026, 7, 31) }
  end

  describe "#all_july" do
    subject { instance.all_july }

    let(:beginning_of_july) { instance.beginning_of_july }
    let(:end_of_july) { instance.end_of_july }

    it { is_expected.to eq ::Range.new(beginning_of_july, end_of_july) }
  end

  describe "#beginning_of_july?" do
    subject { instance.beginning_of_july? }

    context "月初" do
      let(:instance) { ::Date.new(2026, 7, 1) }

      it { is_expected.to be_truthy }
    end

    context "月初以外" do
      let(:instance) { ::Date.new(2026, 7, 2) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#end_of_july?" do
    subject { instance.end_of_july? }

    context "月末" do
      let(:instance) { ::Date.new(2026, 7, 31) }

      it { is_expected.to be_truthy }
    end

    context "月末以外" do
      let(:instance) { ::Date.new(2026, 8, 1) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#in_july?" do
    subject { instance.in_july? }

    context "7月ではない（前月月末）" do
      let(:instance) { ::Date.new(2026, 6, 30) }

      it { is_expected.to be_falsey }
    end

    context "7月月初" do
      let(:instance) { ::Date.new(2026, 7, 1) }

      it { is_expected.to be_truthy }
    end

    context "7月中旬" do
      let(:instance) { ::Date.new(2026, 7, 15) }

      it { is_expected.to be_truthy }
    end

    context "7月月末" do
      let(:instance) { ::Date.new(2026, 7, 30) }

      it { is_expected.to be_truthy }
    end

    context "7月ではない（翌月月初）" do
      let(:instance) { ::Date.new(2026, 8, 1) }

      it { is_expected.to be_falsey }
    end
  end

  #
  # 8月
  #

  describe "#beginning_of_august" do
    subject { instance.beginning_of_august }

    it { is_expected.to eq ::Date.new(2026, 8, 1) }
  end

  describe "#end_of_august" do
    subject { instance.end_of_august }

    it { is_expected.to eq ::Date.new(2026, 8, 31) }
  end

  describe "#all_august" do
    subject { instance.all_august }

    let(:beginning_of_august) { instance.beginning_of_august }
    let(:end_of_august) { instance.end_of_august }

    it { is_expected.to eq ::Range.new(beginning_of_august, end_of_august) }
  end

  describe "#beginning_of_august?" do
    subject { instance.beginning_of_august? }

    context "月初" do
      let(:instance) { ::Date.new(2026, 8, 1) }

      it { is_expected.to be_truthy }
    end

    context "月初以外" do
      let(:instance) { ::Date.new(2026, 8, 2) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#end_of_august?" do
    subject { instance.end_of_august? }

    context "月末" do
      let(:instance) { ::Date.new(2026, 8, 31) }

      it { is_expected.to be_truthy }
    end

    context "月末以外" do
      let(:instance) { ::Date.new(2026, 9, 1) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#in_august?" do
    subject { instance.in_august? }

    context "8月ではない（前月月末）" do
      let(:instance) { ::Date.new(2026, 7, 31) }

      it { is_expected.to be_falsey }
    end

    context "8月月初" do
      let(:instance) { ::Date.new(2026, 8, 1) }

      it { is_expected.to be_truthy }
    end

    context "8月中旬" do
      let(:instance) { ::Date.new(2026, 8, 15) }

      it { is_expected.to be_truthy }
    end

    context "8月月末" do
      let(:instance) { ::Date.new(2026, 8, 31) }

      it { is_expected.to be_truthy }
    end

    context "8月ではない（翌月月初）" do
      let(:instance) { ::Date.new(2026, 9, 1) }

      it { is_expected.to be_falsey }
    end
  end

  #
  # 9月
  #

  describe "#beginning_of_september" do
    subject { instance.beginning_of_september }

    it { is_expected.to eq ::Date.new(2026, 9, 1) }
  end

  describe "#end_of_september" do
    subject { instance.end_of_september }

    it { is_expected.to eq ::Date.new(2026, 9, 30) }
  end

  describe "#all_september" do
    subject { instance.all_september }

    let(:beginning_of_september) { instance.beginning_of_september }
    let(:end_of_september) { instance.end_of_september }

    it { is_expected.to eq ::Range.new(beginning_of_september, end_of_september) }
  end

  describe "#beginning_of_september?" do
    subject { instance.beginning_of_september? }

    context "月初" do
      let(:instance) { ::Date.new(2026, 9, 1) }

      it { is_expected.to be_truthy }
    end

    context "月初以外" do
      let(:instance) { ::Date.new(2026, 9, 2) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#end_of_september?" do
    subject { instance.end_of_september? }

    context "月末" do
      let(:instance) { ::Date.new(2026, 9, 30) }

      it { is_expected.to be_truthy }
    end

    context "月末以外" do
      let(:instance) { ::Date.new(2026, 10, 1) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#in_september?" do
    subject { instance.in_september? }

    context "9月ではない（前月月末）" do
      let(:instance) { ::Date.new(2026, 8, 31) }

      it { is_expected.to be_falsey }
    end

    context "9月月初" do
      let(:instance) { ::Date.new(2026, 9, 1) }

      it { is_expected.to be_truthy }
    end

    context "9月中旬" do
      let(:instance) { ::Date.new(2026, 9, 15) }

      it { is_expected.to be_truthy }
    end

    context "9月月末" do
      let(:instance) { ::Date.new(2026, 9, 30) }

      it { is_expected.to be_truthy }
    end

    context "9月ではない（翌月月初）" do
      let(:instance) { ::Date.new(2026, 10, 1) }

      it { is_expected.to be_falsey }
    end
  end

  #
  # 10月
  #

  describe "#beginning_of_october" do
    subject { instance.beginning_of_october }

    it { is_expected.to eq ::Date.new(2026, 10, 1) }
  end

  describe "#end_of_october" do
    subject { instance.end_of_october }

    it { is_expected.to eq ::Date.new(2026, 10, 31) }
  end

  describe "#all_october" do
    subject { instance.all_october }

    let(:beginning_of_october) { instance.beginning_of_october }
    let(:end_of_october) { instance.end_of_october }

    it { is_expected.to eq ::Range.new(beginning_of_october, end_of_october) }
  end

  describe "#beginning_of_october?" do
    subject { instance.beginning_of_october? }

    context "月初" do
      let(:instance) { ::Date.new(2026, 10, 1) }

      it { is_expected.to be_truthy }
    end

    context "月初以外" do
      let(:instance) { ::Date.new(2026, 10, 2) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#end_of_october?" do
    subject { instance.end_of_october? }

    context "月末" do
      let(:instance) { ::Date.new(2026, 10, 31) }

      it { is_expected.to be_truthy }
    end

    context "月末以外" do
      let(:instance) { ::Date.new(2026, 11, 1) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#in_october?" do
    subject { instance.in_october? }

    context "10月ではない（前月月末）" do
      let(:instance) { ::Date.new(2026, 9, 30) }

      it { is_expected.to be_falsey }
    end

    context "10月月初" do
      let(:instance) { ::Date.new(2026, 10, 1) }

      it { is_expected.to be_truthy }
    end

    context "10月中旬" do
      let(:instance) { ::Date.new(2026, 10, 15) }

      it { is_expected.to be_truthy }
    end

    context "10月月末" do
      let(:instance) { ::Date.new(2026, 10, 31) }

      it { is_expected.to be_truthy }
    end

    context "10月ではない（翌月月初）" do
      let(:instance) { ::Date.new(2026, 11, 1) }

      it { is_expected.to be_falsey }
    end
  end

  #
  # 11月
  #

  describe "#beginning_of_november" do
    subject { instance.beginning_of_november }

    it { is_expected.to eq ::Date.new(2026, 11, 1) }
  end

  describe "#end_of_november" do
    subject { instance.end_of_november }

    it { is_expected.to eq ::Date.new(2026, 11, 30) }
  end

  describe "#all_november" do
    subject { instance.all_november }

    let(:beginning_of_november) { instance.beginning_of_november }
    let(:end_of_november) { instance.end_of_november }

    it { is_expected.to eq ::Range.new(beginning_of_november, end_of_november) }
  end

  describe "#beginning_of_november?" do
    subject { instance.beginning_of_november? }

    context "月初" do
      let(:instance) { ::Date.new(2026, 11, 1) }

      it { is_expected.to be_truthy }
    end

    context "月初以外" do
      let(:instance) { ::Date.new(2026, 11, 2) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#end_of_november?" do
    subject { instance.end_of_november? }

    context "月末" do
      let(:instance) { ::Date.new(2026, 11, 30) }

      it { is_expected.to be_truthy }
    end

    context "月末以外" do
      let(:instance) { ::Date.new(2026, 12, 1) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#in_november?" do
    subject { instance.in_november? }

    context "11月ではない（前月月末）" do
      let(:instance) { ::Date.new(2026, 10, 31) }

      it { is_expected.to be_falsey }
    end

    context "11月月初" do
      let(:instance) { ::Date.new(2026, 11, 1) }

      it { is_expected.to be_truthy }
    end

    context "11月中旬" do
      let(:instance) { ::Date.new(2026, 11, 15) }

      it { is_expected.to be_truthy }
    end

    context "11月月末" do
      let(:instance) { ::Date.new(2026, 11, 30) }

      it { is_expected.to be_truthy }
    end

    context "11月ではない（翌月月初）" do
      let(:instance) { ::Date.new(2026, 12, 1) }

      it { is_expected.to be_falsey }
    end
  end

  #
  # 12月
  #

  describe "#beginning_of_december" do
    subject { instance.beginning_of_december }

    it { is_expected.to eq ::Date.new(2026, 12, 1) }
  end

  describe "#end_of_december" do
    subject { instance.end_of_december }

    it { is_expected.to eq ::Date.new(2026, 12, 31) }
  end

  describe "#all_december" do
    subject { instance.all_december }

    let(:beginning_of_december) { instance.beginning_of_december }
    let(:end_of_december) { instance.end_of_december }

    it { is_expected.to eq ::Range.new(beginning_of_december, end_of_december) }
  end

  describe "#beginning_of_december?" do
    subject { instance.beginning_of_december? }

    context "月初" do
      let(:instance) { ::Date.new(2026, 12, 1) }

      it { is_expected.to be_truthy }
    end

    context "月初以外" do
      let(:instance) { ::Date.new(2026, 12, 2) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#end_of_december?" do
    subject { instance.end_of_december? }

    context "月末" do
      let(:instance) { ::Date.new(2026, 12, 31) }

      it { is_expected.to be_truthy }
    end

    context "月末以外" do
      let(:instance) { ::Date.new(2027, 1, 1) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#in_december?" do
    subject { instance.in_december? }

    context "12月ではない（前月月末）" do
      let(:instance) { ::Date.new(2026, 11, 30) }

      it { is_expected.to be_falsey }
    end

    context "12月月初" do
      let(:instance) { ::Date.new(2026, 12, 1) }

      it { is_expected.to be_truthy }
    end

    context "12月中旬" do
      let(:instance) { ::Date.new(2026, 12, 15) }

      it { is_expected.to be_truthy }
    end

    context "12月月末" do
      let(:instance) { ::Date.new(2026, 12, 31) }

      it { is_expected.to be_truthy }
    end

    context "12月ではない（翌月月初）" do
      let(:instance) { ::Date.new(2027, 1, 1) }

      it { is_expected.to be_falsey }
    end
  end

  # ###################################################################################################################
  # 四半期関係
  # ###################################################################################################################

  #
  # 第1四半期
  #

  describe "#beginning_of_first_quarter" do
    context "1月始まりの場合（初期値）" do
      let(:on_fy_2024) { ::Date.new(2024, 1, 1) }
      let(:on_fy_2025) { ::Date.new(2025, 1, 1) }
      let(:on_fy_2026) { ::Date.new(2026, 1, 1) }
      let(:on_fy_2027) { ::Date.new(2027, 1, 1) }

      it { expect(::Date.new(2025,  1, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025,  2, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025,  3, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025,  4, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025,  5, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025,  6, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025,  7, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025,  8, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025,  9, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025, 10, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025, 11, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025, 12, 1).beginning_of_first_quarter).to eq on_fy_2025 }

      it { expect(::Date.new(2026,  1, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026,  2, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026,  3, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026,  4, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026,  5, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026,  6, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026,  7, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026,  8, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026,  9, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026, 10, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026, 11, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026, 12, 1).beginning_of_first_quarter).to eq on_fy_2026 }

      it { expect(::Date.new(2027,  1, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027,  2, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027,  3, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027,  4, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027,  5, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027,  6, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027,  7, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027,  8, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027,  9, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027, 10, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027, 11, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027, 12, 1).beginning_of_first_quarter).to eq on_fy_2027 }
    end

    context "2月始まりの場合" do
      let(:on_fy_2024) { ::Date.new(2024, 2, 1) }
      let(:on_fy_2025) { ::Date.new(2025, 2, 1) }
      let(:on_fy_2026) { ::Date.new(2026, 2, 1) }
      let(:on_fy_2027) { ::Date.new(2027, 2, 1) }

      before do
        ::Decentworks::DateSupport.configure do |config|
          config.beginning_of_first_quarter = :february
        end
      end

      it { expect(::Date.new(2025,  1, 1).beginning_of_first_quarter).to eq on_fy_2024 }

      it { expect(::Date.new(2025,  2, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025,  3, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025,  4, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025,  5, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025,  6, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025,  7, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025,  8, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025,  9, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025, 10, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025, 11, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025, 12, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  1, 1).beginning_of_first_quarter).to eq on_fy_2025 }

      it { expect(::Date.new(2026,  2, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026,  3, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026,  4, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026,  5, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026,  6, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026,  7, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026,  8, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026,  9, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026, 10, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026, 11, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026, 12, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  1, 1).beginning_of_first_quarter).to eq on_fy_2026 }

      it { expect(::Date.new(2027,  2, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027,  3, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027,  4, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027,  5, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027,  6, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027,  7, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027,  8, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027,  9, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027, 10, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027, 11, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027, 12, 1).beginning_of_first_quarter).to eq on_fy_2027 }
    end

    context "3月始まりの場合" do
      let(:on_fy_2024) { ::Date.new(2024, 3, 1) }
      let(:on_fy_2025) { ::Date.new(2025, 3, 1) }
      let(:on_fy_2026) { ::Date.new(2026, 3, 1) }
      let(:on_fy_2027) { ::Date.new(2027, 3, 1) }

      before do
        ::Decentworks::DateSupport.configure do |config|
          config.beginning_of_first_quarter = :march
        end
      end

      it { expect(::Date.new(2025,  1, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  2, 1).beginning_of_first_quarter).to eq on_fy_2024 }

      it { expect(::Date.new(2025,  3, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025,  4, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025,  5, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025,  6, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025,  7, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025,  8, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025,  9, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025, 10, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025, 11, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025, 12, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  1, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  2, 1).beginning_of_first_quarter).to eq on_fy_2025 }

      it { expect(::Date.new(2026,  3, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026,  4, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026,  5, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026,  6, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026,  7, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026,  8, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026,  9, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026, 10, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026, 11, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026, 12, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  1, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  2, 1).beginning_of_first_quarter).to eq on_fy_2026 }

      it { expect(::Date.new(2027,  3, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027,  4, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027,  5, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027,  6, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027,  7, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027,  8, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027,  9, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027, 10, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027, 11, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027, 12, 1).beginning_of_first_quarter).to eq on_fy_2027 }
    end

    context "4月始まりの場合" do
      let(:on_fy_2024) { ::Date.new(2024, 4, 1) }
      let(:on_fy_2025) { ::Date.new(2025, 4, 1) }
      let(:on_fy_2026) { ::Date.new(2026, 4, 1) }
      let(:on_fy_2027) { ::Date.new(2027, 4, 1) }

      before do
        ::Decentworks::DateSupport.configure do |config|
          config.beginning_of_first_quarter = :april
        end
      end

      it { expect(::Date.new(2025,  1, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  2, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  3, 1).beginning_of_first_quarter).to eq on_fy_2024 }

      it { expect(::Date.new(2025,  4, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025,  5, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025,  6, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025,  7, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025,  8, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025,  9, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025, 10, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025, 11, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025, 12, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  1, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  2, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  3, 1).beginning_of_first_quarter).to eq on_fy_2025 }

      it { expect(::Date.new(2026,  4, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026,  5, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026,  6, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026,  7, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026,  8, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026,  9, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026, 10, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026, 11, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026, 12, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  1, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  2, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  3, 1).beginning_of_first_quarter).to eq on_fy_2026 }

      it { expect(::Date.new(2027,  4, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027,  5, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027,  6, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027,  7, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027,  8, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027,  9, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027, 10, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027, 11, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027, 12, 1).beginning_of_first_quarter).to eq on_fy_2027 }
    end

    context "5月始まりの場合" do
      let(:on_fy_2024) { ::Date.new(2024, 5, 1) }
      let(:on_fy_2025) { ::Date.new(2025, 5, 1) }
      let(:on_fy_2026) { ::Date.new(2026, 5, 1) }
      let(:on_fy_2027) { ::Date.new(2027, 5, 1) }

      before do
        ::Decentworks::DateSupport.configure do |config|
          config.beginning_of_first_quarter = :may
        end
      end

      it { expect(::Date.new(2025,  1, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  2, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  3, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  4, 1).beginning_of_first_quarter).to eq on_fy_2024 }

      it { expect(::Date.new(2025,  5, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025,  6, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025,  7, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025,  8, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025,  9, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025, 10, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025, 11, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025, 12, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  1, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  2, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  3, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  4, 1).beginning_of_first_quarter).to eq on_fy_2025 }

      it { expect(::Date.new(2026,  5, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026,  6, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026,  7, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026,  8, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026,  9, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026, 10, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026, 11, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026, 12, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  1, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  2, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  3, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  4, 1).beginning_of_first_quarter).to eq on_fy_2026 }

      it { expect(::Date.new(2027,  5, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027,  6, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027,  7, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027,  8, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027,  9, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027, 10, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027, 11, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027, 12, 1).beginning_of_first_quarter).to eq on_fy_2027 }
    end

    context "6月始まりの場合" do
      let(:on_fy_2024) { ::Date.new(2024, 6, 1) }
      let(:on_fy_2025) { ::Date.new(2025, 6, 1) }
      let(:on_fy_2026) { ::Date.new(2026, 6, 1) }
      let(:on_fy_2027) { ::Date.new(2027, 6, 1) }

      before do
        ::Decentworks::DateSupport.configure do |config|
          config.beginning_of_first_quarter = :june
        end
      end

      it { expect(::Date.new(2025,  1, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  2, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  3, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  4, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  5, 1).beginning_of_first_quarter).to eq on_fy_2024 }

      it { expect(::Date.new(2025,  6, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025,  7, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025,  8, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025,  9, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025, 10, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025, 11, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025, 12, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  1, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  2, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  3, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  4, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  5, 1).beginning_of_first_quarter).to eq on_fy_2025 }

      it { expect(::Date.new(2026,  6, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026,  7, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026,  8, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026,  9, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026, 10, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026, 11, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026, 12, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  1, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  2, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  3, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  4, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  5, 1).beginning_of_first_quarter).to eq on_fy_2026 }

      it { expect(::Date.new(2027,  6, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027,  7, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027,  8, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027,  9, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027, 10, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027, 11, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027, 12, 1).beginning_of_first_quarter).to eq on_fy_2027 }
    end

    context "7月始まりの場合" do
      let(:on_fy_2024) { ::Date.new(2024, 7, 1) }
      let(:on_fy_2025) { ::Date.new(2025, 7, 1) }
      let(:on_fy_2026) { ::Date.new(2026, 7, 1) }
      let(:on_fy_2027) { ::Date.new(2027, 7, 1) }

      before do
        ::Decentworks::DateSupport.configure do |config|
          config.beginning_of_first_quarter = :july
        end
      end

      it { expect(::Date.new(2025,  1, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  2, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  3, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  4, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  5, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  6, 1).beginning_of_first_quarter).to eq on_fy_2024 }

      it { expect(::Date.new(2025,  7, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025,  8, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025,  9, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025, 10, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025, 11, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025, 12, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  1, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  2, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  3, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  4, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  5, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  6, 1).beginning_of_first_quarter).to eq on_fy_2025 }

      it { expect(::Date.new(2026,  7, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026,  8, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026,  9, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026, 10, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026, 11, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026, 12, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  1, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  2, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  3, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  4, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  5, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  6, 1).beginning_of_first_quarter).to eq on_fy_2026 }

      it { expect(::Date.new(2027,  7, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027,  8, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027,  9, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027, 10, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027, 11, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027, 12, 1).beginning_of_first_quarter).to eq on_fy_2027 }
    end

    context "8月始まりの場合" do
      let(:on_fy_2024) { ::Date.new(2024, 8, 1) }
      let(:on_fy_2025) { ::Date.new(2025, 8, 1) }
      let(:on_fy_2026) { ::Date.new(2026, 8, 1) }
      let(:on_fy_2027) { ::Date.new(2027, 8, 1) }

      before do
        ::Decentworks::DateSupport.configure do |config|
          config.beginning_of_first_quarter = :august
        end
      end

      it { expect(::Date.new(2025,  1, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  2, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  3, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  4, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  5, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  6, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  7, 1).beginning_of_first_quarter).to eq on_fy_2024 }

      it { expect(::Date.new(2025,  8, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025,  9, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025, 10, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025, 11, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025, 12, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  1, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  2, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  3, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  4, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  5, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  6, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  7, 1).beginning_of_first_quarter).to eq on_fy_2025 }

      it { expect(::Date.new(2026,  8, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026,  9, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026, 10, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026, 11, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026, 12, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  1, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  2, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  3, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  4, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  5, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  6, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  7, 1).beginning_of_first_quarter).to eq on_fy_2026 }

      it { expect(::Date.new(2027,  8, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027,  9, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027, 10, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027, 11, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027, 12, 1).beginning_of_first_quarter).to eq on_fy_2027 }
    end

    context "9月始まりの場合" do
      let(:on_fy_2024) { ::Date.new(2024, 9, 1) }
      let(:on_fy_2025) { ::Date.new(2025, 9, 1) }
      let(:on_fy_2026) { ::Date.new(2026, 9, 1) }
      let(:on_fy_2027) { ::Date.new(2027, 9, 1) }

      before do
        ::Decentworks::DateSupport.configure do |config|
          config.beginning_of_first_quarter = :september
        end
      end

      it { expect(::Date.new(2025,  1, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  2, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  3, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  4, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  5, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  6, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  7, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  8, 1).beginning_of_first_quarter).to eq on_fy_2024 }

      it { expect(::Date.new(2025,  9, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025, 10, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025, 11, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025, 12, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  1, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  2, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  3, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  4, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  5, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  6, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  7, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  8, 1).beginning_of_first_quarter).to eq on_fy_2025 }

      it { expect(::Date.new(2026,  9, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026, 10, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026, 11, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026, 12, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  1, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  2, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  3, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  4, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  5, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  6, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  7, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  8, 1).beginning_of_first_quarter).to eq on_fy_2026 }

      it { expect(::Date.new(2027,  9, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027, 10, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027, 11, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027, 12, 1).beginning_of_first_quarter).to eq on_fy_2027 }
    end

    context "10月始まりの場合" do
      let(:on_fy_2024) { ::Date.new(2024, 10, 1) }
      let(:on_fy_2025) { ::Date.new(2025, 10, 1) }
      let(:on_fy_2026) { ::Date.new(2026, 10, 1) }
      let(:on_fy_2027) { ::Date.new(2027, 10, 1) }

      before do
        ::Decentworks::DateSupport.configure do |config|
          config.beginning_of_first_quarter = :october
        end
      end

      it { expect(::Date.new(2025,  1, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  2, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  3, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  4, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  5, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  6, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  7, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  8, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  9, 1).beginning_of_first_quarter).to eq on_fy_2024 }

      it { expect(::Date.new(2025, 10, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025, 11, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025, 12, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  1, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  2, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  3, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  4, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  5, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  6, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  7, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  8, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  9, 1).beginning_of_first_quarter).to eq on_fy_2025 }

      it { expect(::Date.new(2026, 10, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026, 11, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026, 12, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  1, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  2, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  3, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  4, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  5, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  6, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  7, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  8, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  9, 1).beginning_of_first_quarter).to eq on_fy_2026 }

      it { expect(::Date.new(2027, 10, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027, 11, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027, 12, 1).beginning_of_first_quarter).to eq on_fy_2027 }
    end

    context "11月始まりの場合" do
      let(:on_fy_2024) { ::Date.new(2024, 11, 1) }
      let(:on_fy_2025) { ::Date.new(2025, 11, 1) }
      let(:on_fy_2026) { ::Date.new(2026, 11, 1) }
      let(:on_fy_2027) { ::Date.new(2027, 11, 1) }

      before do
        ::Decentworks::DateSupport.configure do |config|
          config.beginning_of_first_quarter = :november
        end
      end

      it { expect(::Date.new(2025,  1, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  2, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  3, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  4, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  5, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  6, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  7, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  8, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  9, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025, 10, 1).beginning_of_first_quarter).to eq on_fy_2024 }

      it { expect(::Date.new(2025, 11, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2025, 12, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  1, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  2, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  3, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  4, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  5, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  6, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  7, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  8, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  9, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026, 10, 1).beginning_of_first_quarter).to eq on_fy_2025 }

      it { expect(::Date.new(2026, 11, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2026, 12, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  1, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  2, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  3, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  4, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  5, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  6, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  7, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  8, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  9, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027, 10, 1).beginning_of_first_quarter).to eq on_fy_2026 }

      it { expect(::Date.new(2027, 11, 1).beginning_of_first_quarter).to eq on_fy_2027 }
      it { expect(::Date.new(2027, 12, 1).beginning_of_first_quarter).to eq on_fy_2027 }
    end

    context "12月始まりの場合" do
      let(:on_fy_2024) { ::Date.new(2024, 12, 1) }
      let(:on_fy_2025) { ::Date.new(2025, 12, 1) }
      let(:on_fy_2026) { ::Date.new(2026, 12, 1) }
      let(:on_fy_2027) { ::Date.new(2027, 12, 1) }

      before do
        ::Decentworks::DateSupport.configure do |config|
          config.beginning_of_first_quarter = :december
        end
      end

      it { expect(::Date.new(2025,  1, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  2, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  3, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  4, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  5, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  6, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  7, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  8, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025,  9, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025, 10, 1).beginning_of_first_quarter).to eq on_fy_2024 }
      it { expect(::Date.new(2025, 11, 1).beginning_of_first_quarter).to eq on_fy_2024 }

      it { expect(::Date.new(2025, 12, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  1, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  2, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  3, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  4, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  5, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  6, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  7, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  8, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026,  9, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026, 10, 1).beginning_of_first_quarter).to eq on_fy_2025 }
      it { expect(::Date.new(2026, 11, 1).beginning_of_first_quarter).to eq on_fy_2025 }

      it { expect(::Date.new(2026, 12, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  1, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  2, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  3, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  4, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  5, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  6, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  7, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  8, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027,  9, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027, 10, 1).beginning_of_first_quarter).to eq on_fy_2026 }
      it { expect(::Date.new(2027, 11, 1).beginning_of_first_quarter).to eq on_fy_2026 }

      it { expect(::Date.new(2027, 12, 1).beginning_of_first_quarter).to eq on_fy_2027 }
    end
  end

  describe "#end_of_first_quarter" do
    subject { instance.end_of_first_quarter }

    context "1月始まりの場合（初期値）" do
      it { is_expected.to eq ::Date.new(2026, 3, 31) }
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.beginning_of_first_quarter = :april
        end
      end

      it { is_expected.to eq ::Date.new(2026, 6, 30) }
    end
  end

  describe "#all_first_quarter" do
    subject { instance.all_first_quarter }

    let(:beginning_of_first_quarter) { instance.beginning_of_first_quarter }
    let(:end_of_first_quarter) { instance.end_of_first_quarter }

    it { is_expected.to eq ::Range.new(beginning_of_first_quarter, end_of_first_quarter) }
  end

  describe "#beginning_of_first_quarter?" do
    subject { instance.beginning_of_first_quarter? }

    context "1月始まりの場合（初期値）" do
      context "期首" do
        let(:instance) { ::Date.new(2026, 1, 1) }

        it { is_expected.to be_truthy }
      end

      context "期首以外" do
        let(:instance) { ::Date.new(2026, 1, 2) }

        it { is_expected.to be_falsey }
      end
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.beginning_of_first_quarter = :april
        end
      end

      context "期首" do
        let(:instance) { ::Date.new(2026, 4, 1) }

        it { is_expected.to be_truthy }
      end

      context "期首以外" do
        let(:instance) { ::Date.new(2026, 4, 2) }

        it { is_expected.to be_falsey }
      end
    end
  end

  describe "#end_of_first_quarter?" do
    subject { instance.end_of_first_quarter? }

    context "1月始まりの場合（初期値）" do
      context "期末" do
        let(:instance) { ::Date.new(2026, 3, 31) }

        it { is_expected.to be_truthy }
      end

      context "期末以外" do
        let(:instance) { ::Date.new(2026, 4, 1) }

        it { is_expected.to be_falsey }
      end
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.beginning_of_first_quarter = :april
        end
      end

      context "期末" do
        let(:instance) { ::Date.new(2026, 6, 30) }

        it { is_expected.to be_truthy }
      end

      context "期末以外" do
        let(:instance) { ::Date.new(2026, 7, 1) }

        it { is_expected.to be_falsey }
      end
    end
  end

  describe "#in_first_quarter?" do
    subject { instance.in_first_quarter? }

    context "第1四半期ではない（前期期末）" do
      let(:instance) { ::Date.new(2025, 12, 31) }

      it { is_expected.to be_falsey }
    end

    context "第1四半期期首" do
      let(:instance) { ::Date.new(2026, 1, 1) }

      it { is_expected.to be_truthy }
    end

    context "第1四半期中" do
      let(:instance) { ::Date.new(2026, 2, 15) }

      it { is_expected.to be_truthy }
    end

    context "第1四半期末" do
      let(:instance) { ::Date.new(2026, 3, 31) }

      it { is_expected.to be_truthy }
    end

    context "第1四半期ではない（翌期期首）" do
      let(:instance) { ::Date.new(2026, 4, 1) }

      it { is_expected.to be_falsey }
    end
  end

  #
  # 第2四半期
  #

  describe "#beginning_of_second_quarter" do
    subject { instance.beginning_of_second_quarter }

    context "1月始まりの場合（初期値）" do
      it { is_expected.to eq ::Date.new(2026, 4, 1) }
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.beginning_of_first_quarter = :april
        end
      end

      it { is_expected.to eq ::Date.new(2026, 7, 1) }
    end
  end

  describe "#end_of_second_quarter" do
    subject { instance.end_of_second_quarter }

    context "1月始まりの場合（初期値）" do
      it { is_expected.to eq ::Date.new(2026, 6, 30) }
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.beginning_of_first_quarter = :april
        end
      end

      it { is_expected.to eq ::Date.new(2026, 9, 30) }
    end
  end

  describe "#all_second_quarter" do
    subject { instance.all_second_quarter }

    let(:beginning_of_second_quarter) { instance.beginning_of_second_quarter }
    let(:end_of_second_quarter) { instance.end_of_second_quarter }

    it { is_expected.to eq ::Range.new(beginning_of_second_quarter, end_of_second_quarter) }
  end

  describe "#beginning_of_second_quarter?" do
    subject { instance.beginning_of_second_quarter? }

    context "1月始まりの場合（初期値）" do
      context "期首" do
        let(:instance) { ::Date.new(2026, 4, 1) }

        it { is_expected.to be_truthy }
      end

      context "期首以外" do
        let(:instance) { ::Date.new(2026, 4, 2) }

        it { is_expected.to be_falsey }
      end
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.beginning_of_first_quarter = :april
        end
      end

      context "期首" do
        let(:instance) { ::Date.new(2026, 7, 1) }

        it { is_expected.to be_truthy }
      end

      context "期首以外" do
        let(:instance) { ::Date.new(2026, 7, 2) }

        it { is_expected.to be_falsey }
      end
    end
  end

  describe "#end_of_second_quarter?" do
    subject { instance.end_of_second_quarter? }

    context "1月始まりの場合（初期値）" do
      context "期末" do
        let(:instance) { ::Date.new(2026, 6, 30) }

        it { is_expected.to be_truthy }
      end

      context "期末以外" do
        let(:instance) { ::Date.new(2026, 7, 1) }

        it { is_expected.to be_falsey }
      end
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.beginning_of_first_quarter = :april
        end
      end

      context "期末" do
        let(:instance) { ::Date.new(2026, 9, 30) }

        it { is_expected.to be_truthy }
      end

      context "期末以外" do
        let(:instance) { ::Date.new(2026, 10, 1) }

        it { is_expected.to be_falsey }
      end
    end
  end

  describe "#in_second_quarter?" do
    subject { instance.in_second_quarter? }

    context "第2四半期ではない（前期期末）" do
      let(:instance) { ::Date.new(2026, 3, 31) }

      it { is_expected.to be_falsey }
    end

    context "第2四半期期首" do
      let(:instance) { ::Date.new(2026, 4, 1) }

      it { is_expected.to be_truthy }
    end

    context "第2四半期中" do
      let(:instance) { ::Date.new(2026, 5, 15) }

      it { is_expected.to be_truthy }
    end

    context "第2四半期末" do
      let(:instance) { ::Date.new(2026, 6, 30) }

      it { is_expected.to be_truthy }
    end

    context "第2四半期ではない（翌期期首）" do
      let(:instance) { ::Date.new(2026, 7, 1) }

      it { is_expected.to be_falsey }
    end
  end

  #
  # 第3四半期
  #

  describe "#beginning_of_third_quarter" do
    subject { instance.beginning_of_third_quarter }

    context "1月始まりの場合（初期値）" do
      it { is_expected.to eq ::Date.new(2026, 7, 1) }
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.beginning_of_first_quarter = :april
        end
      end

      it { is_expected.to eq ::Date.new(2026, 10, 1) }
    end
  end

  describe "#end_of_third_quarter" do
    subject { instance.end_of_third_quarter }

    context "1月始まりの場合（初期値）" do
      it { is_expected.to eq ::Date.new(2026, 9, 30) }
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.beginning_of_first_quarter = :april
        end
      end

      it { is_expected.to eq ::Date.new(2026, 12, 31) }
    end
  end

  describe "#all_third_quarter" do
    subject { instance.all_third_quarter }

    let(:beginning_of_third_quarter) { instance.beginning_of_third_quarter }
    let(:end_of_third_quarter) { instance.end_of_third_quarter }

    it { is_expected.to eq ::Range.new(beginning_of_third_quarter, end_of_third_quarter) }
  end

  describe "#beginning_of_third_quarter?" do
    subject { instance.beginning_of_third_quarter? }

    context "1月始まりの場合（初期値）" do
      context "期首" do
        let(:instance) { ::Date.new(2026, 7, 1) }

        it { is_expected.to be_truthy }
      end

      context "期首以外" do
        let(:instance) { ::Date.new(2026, 7, 2) }

        it { is_expected.to be_falsey }
      end
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.beginning_of_first_quarter = :april
        end
      end

      context "期首" do
        let(:instance) { ::Date.new(2026, 10, 1) }

        it { is_expected.to be_truthy }
      end

      context "期首以外" do
        let(:instance) { ::Date.new(2026, 10, 2) }

        it { is_expected.to be_falsey }
      end
    end
  end

  describe "#end_of_third_quarter?" do
    subject { instance.end_of_third_quarter? }

    context "1月始まりの場合（初期値）" do
      context "期末" do
        let(:instance) { ::Date.new(2026, 9, 30) }

        it { is_expected.to be_truthy }
      end

      context "期末以外" do
        let(:instance) { ::Date.new(2026, 10, 1) }

        it { is_expected.to be_falsey }
      end
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.beginning_of_first_quarter = :april
        end
      end

      context "期末" do
        let(:instance) { ::Date.new(2026, 12, 31) }

        it { is_expected.to be_truthy }
      end

      context "期末以外" do
        let(:instance) { ::Date.new(2027, 1, 1) }

        it { is_expected.to be_falsey }
      end
    end
  end

  describe "#in_third_quarter?" do
    subject { instance.in_third_quarter? }

    context "第3四半期ではない（前期期末）" do
      let(:instance) { ::Date.new(2026, 6, 30) }

      it { is_expected.to be_falsey }
    end

    context "第3四半期期首" do
      let(:instance) { ::Date.new(2026, 7, 1) }

      it { is_expected.to be_truthy }
    end

    context "第3四半期中" do
      let(:instance) { ::Date.new(2026, 8, 15) }

      it { is_expected.to be_truthy }
    end

    context "第3四半期末" do
      let(:instance) { ::Date.new(2026, 9, 30) }

      it { is_expected.to be_truthy }
    end

    context "第3四半期ではない（翌期期首）" do
      let(:instance) { ::Date.new(2026, 10, 1) }

      it { is_expected.to be_falsey }
    end
  end

  #
  # 第4四半期
  #

  describe "#beginning_of_fourth_quarter" do
    subject { instance.beginning_of_fourth_quarter }

    context "1月始まりの場合（初期値）" do
      it { is_expected.to eq ::Date.new(2026, 10, 1) }
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.beginning_of_first_quarter = :april
        end
      end

      it { is_expected.to eq ::Date.new(2027, 1, 1) }
    end
  end

  describe "#end_of_fourth_quarter" do
    subject { instance.end_of_fourth_quarter }

    context "1月始まりの場合（初期値）" do
      it { is_expected.to eq ::Date.new(2026, 12, 31) }
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.beginning_of_first_quarter = :april
        end
      end

      it { is_expected.to eq ::Date.new(2027, 3, 31) }
    end
  end

  describe "#all_fourth_quarter" do
    subject { instance.all_fourth_quarter }

    let(:beginning_of_fourth_quarter) { instance.beginning_of_fourth_quarter }
    let(:end_of_fourth_quarter) { instance.end_of_fourth_quarter }

    it { is_expected.to eq ::Range.new(beginning_of_fourth_quarter, end_of_fourth_quarter) }
  end

  describe "#beginning_of_fourth_quarter?" do
    subject { instance.beginning_of_fourth_quarter? }

    context "1月始まりの場合（初期値）" do
      context "期首" do
        let(:instance) { ::Date.new(2026, 10, 1) }

        it { is_expected.to be_truthy }
      end

      context "期首以外" do
        let(:instance) { ::Date.new(2026, 10, 2) }

        it { is_expected.to be_falsey }
      end
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.beginning_of_first_quarter = :april
        end
      end

      context "期首" do
        let(:instance) { ::Date.new(2027, 1, 1) }

        it { is_expected.to be_truthy }
      end

      context "期首以外" do
        let(:instance) { ::Date.new(2027, 1, 2) }

        it { is_expected.to be_falsey }
      end
    end
  end

  describe "#end_of_fourth_quarter?" do
    subject { instance.end_of_fourth_quarter? }

    context "1月始まりの場合（初期値）" do
      context "期末" do
        let(:instance) { ::Date.new(2026, 12, 31) }

        it { is_expected.to be_truthy }
      end

      context "期末以外" do
        let(:instance) { ::Date.new(2027, 12, 1) }

        it { is_expected.to be_falsey }
      end
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.beginning_of_first_quarter = :april
        end
      end

      context "期末" do
        let(:instance) { ::Date.new(2027, 3, 31) }

        it { is_expected.to be_truthy }
      end

      context "期末以外" do
        let(:instance) { ::Date.new(2027, 4, 1) }

        it { is_expected.to be_falsey }
      end
    end
  end

  describe "#in_fourth_quarter?" do
    subject { instance.in_fourth_quarter? }

    context "第4四半期ではない（前期期末）" do
      let(:instance) { ::Date.new(2026, 9, 30) }

      it { is_expected.to be_falsey }
    end

    context "第4四半期期首" do
      let(:instance) { ::Date.new(2026, 10, 1) }

      it { is_expected.to be_truthy }
    end

    context "第4四半期中" do
      let(:instance) { ::Date.new(2026, 11, 15) }

      it { is_expected.to be_truthy }
    end

    context "第4四半期末" do
      let(:instance) { ::Date.new(2026, 12, 31) }

      it { is_expected.to be_truthy }
    end

    context "第4四半期ではない（翌期期首）" do
      let(:instance) { ::Date.new(2027, 1, 1) }

      it { is_expected.to be_falsey }
    end
  end

  # ###################################################################################################################
  # 上下期関係
  # ###################################################################################################################

  #
  # 上期
  #

  describe "#beginning_of_first_half" do
    subject { instance.beginning_of_first_half }

    context "1月始まりの場合（初期値）" do
      it { is_expected.to eq ::Date.new(2026, 1, 1) }
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.beginning_of_first_quarter = :april
        end
      end

      it { is_expected.to eq ::Date.new(2026, 4, 1) }
    end
  end

  describe "#end_of_first_half" do
    subject { instance.end_of_first_half }

    context "1月始まりの場合（初期値）" do
      it { is_expected.to eq ::Date.new(2026, 6, 30) }
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.beginning_of_first_quarter = :april
        end
      end

      it { is_expected.to eq ::Date.new(2026, 9, 30) }
    end
  end

  describe "#all_first_half" do
    subject { instance.all_first_half }

    let(:beginning_of_first_half) { instance.beginning_of_first_half }
    let(:end_of_first_half) { instance.end_of_first_half }

    it { is_expected.to eq ::Range.new(beginning_of_first_half, end_of_first_half) }
  end

  describe "#beginning_of_first_half?" do
    subject { instance.beginning_of_first_half? }

    context "1月始まりの場合（初期値）" do
      context "期首" do
        let(:instance) { ::Date.new(2026, 1, 1) }

        it { is_expected.to be_truthy }
      end

      context "期首以外" do
        let(:instance) { ::Date.new(2026, 1, 2) }

        it { is_expected.to be_falsey }
      end
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.beginning_of_first_quarter = :april
        end
      end

      context "期首" do
        let(:instance) { ::Date.new(2026, 4, 1) }

        it { is_expected.to be_truthy }
      end

      context "期首以外" do
        let(:instance) { ::Date.new(2026, 4, 2) }

        it { is_expected.to be_falsey }
      end
    end
  end

  describe "#end_of_first_half?" do
    subject { instance.end_of_first_half? }

    context "1月始まりの場合（初期値）" do
      context "期末" do
        let(:instance) { ::Date.new(2026, 6, 30) }

        it { is_expected.to be_truthy }
      end

      context "期末以外" do
        let(:instance) { ::Date.new(2026, 7, 1) }

        it { is_expected.to be_falsey }
      end
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.beginning_of_first_quarter = :april
        end
      end

      context "期末" do
        let(:instance) { ::Date.new(2026, 9, 30) }

        it { is_expected.to be_truthy }
      end

      context "期末以外" do
        let(:instance) { ::Date.new(2026, 10, 1) }

        it { is_expected.to be_falsey }
      end
    end
  end

  describe "#in_first_half?" do
    subject { instance.in_first_half? }

    context "上期ではない（前期期末）" do
      let(:instance) { ::Date.new(2025, 12, 31) }

      it { is_expected.to be_falsey }
    end

    context "上期期首" do
      let(:instance) { ::Date.new(2026, 1, 1) }

      it { is_expected.to be_truthy }
    end

    context "上期中" do
      let(:instance) { ::Date.new(2026, 2, 15) }

      it { is_expected.to be_truthy }
    end

    context "上期末" do
      let(:instance) { ::Date.new(2026, 6, 30) }

      it { is_expected.to be_truthy }
    end

    context "上期ではない（翌期期首）" do
      let(:instance) { ::Date.new(2027, 7, 1) }

      it { is_expected.to be_falsey }
    end
  end

  #
  # 下期
  #

  describe "#beginning_of_second_half" do
    subject { instance.beginning_of_second_half }

    context "1月始まりの場合（初期値）" do
      it { is_expected.to eq ::Date.new(2026, 7, 1) }
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.beginning_of_first_quarter = :april
        end
      end

      it { is_expected.to eq ::Date.new(2026, 10, 1) }
    end
  end

  describe "#end_of_second_half" do
    subject { instance.end_of_second_half }

    context "1月始まりの場合（初期値）" do
      it { is_expected.to eq ::Date.new(2026, 12, 31) }
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.beginning_of_first_quarter = :april
        end
      end

      it { is_expected.to eq ::Date.new(2027, 3, 31) }
    end
  end

  describe "#all_second_half" do
    subject { instance.all_second_half }

    let(:beginning_of_second_half) { instance.beginning_of_second_half }
    let(:end_of_second_half) { instance.end_of_second_half }

    it { is_expected.to eq ::Range.new(beginning_of_second_half, end_of_second_half) }
  end

  describe "#beginning_of_second_half?" do
    subject { instance.beginning_of_second_half? }

    context "1月始まりの場合（初期値）" do
      context "期首" do
        let(:instance) { ::Date.new(2026, 7, 1) }

        it { is_expected.to be_truthy }
      end

      context "期首以外" do
        let(:instance) { ::Date.new(2026, 7, 2) }

        it { is_expected.to be_falsey }
      end
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.beginning_of_first_quarter = :april
        end
      end

      context "期首" do
        let(:instance) { ::Date.new(2026, 10, 1) }

        it { is_expected.to be_truthy }
      end

      context "期首以外" do
        let(:instance) { ::Date.new(2026, 10, 2) }

        it { is_expected.to be_falsey }
      end
    end
  end

  describe "#end_of_second_half?" do
    subject { instance.end_of_second_half? }

    context "1月始まりの場合（初期値）" do
      context "期末" do
        let(:instance) { ::Date.new(2026, 12, 31) }

        it { is_expected.to be_truthy }
      end

      context "期末以外" do
        let(:instance) { ::Date.new(2027, 1, 1) }

        it { is_expected.to be_falsey }
      end
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.beginning_of_first_quarter = :april
        end
      end

      context "期末" do
        let(:instance) { ::Date.new(2027, 3, 31) }

        it { is_expected.to be_truthy }
      end

      context "期末以外" do
        let(:instance) { ::Date.new(2027, 4, 1) }

        it { is_expected.to be_falsey }
      end
    end
  end

  describe "#in_second_half?" do
    subject { instance.in_second_half? }

    context "下期ではない（前期期末）" do
      let(:instance) { ::Date.new(2026, 6, 30) }

      it { is_expected.to be_falsey }
    end

    context "下期期首" do
      let(:instance) { ::Date.new(2026, 7, 1) }

      it { is_expected.to be_truthy }
    end

    context "下期中" do
      let(:instance) { ::Date.new(2026, 8, 15) }

      it { is_expected.to be_truthy }
    end

    context "下期末" do
      let(:instance) { ::Date.new(2026, 12, 31) }

      it { is_expected.to be_truthy }
    end

    context "下期ではない（翌期期首）" do
      let(:instance) { ::Date.new(2027, 1, 1) }

      it { is_expected.to be_falsey }
    end
  end

  # ###################################################################################################################
  # 満経過月数
  # ###################################################################################################################

  describe ".whole_months_elapsed" do
    subject { ::Date.whole_months_elapsed(from:, to:) }

    let(:from) { ::Date.new(2026, 8, 5) }
    let(:to) { ::Date.new(2026, 9, 5) }

    context "1月以内の場合" do
      let(:from) { ::Date.new(2026, 8, 5) }
      let(:to) { ::Date.new(2026, 9, 4) }

      it { is_expected.to eq(0) }
    end

    context "1月ちょうどの場合" do
      let(:from) { ::Date.new(2026, 8, 5) }
      let(:to) { ::Date.new(2026, 9, 5) }

      it { is_expected.to eq(1) }
    end

    context "1月を超える場合" do
      let(:from) { ::Date.new(2026, 8, 5) }
      let(:to) { ::Date.new(2026, 9, 6) }

      it { is_expected.to eq(1) }
    end

    context "1年以内の場合" do
      let(:from) { ::Date.new(2026, 8, 5) }
      let(:to) { ::Date.new(2027, 8, 4) }

      it { is_expected.to eq(11) }
    end

    context "1年ちょうどの場合" do
      let(:from) { ::Date.new(2026, 8, 5) }
      let(:to) { ::Date.new(2027, 8, 5) }

      it { is_expected.to eq(12) }
    end

    context "1年を超える場合" do
      let(:from) { ::Date.new(2026, 8, 5) }
      let(:to) { ::Date.new(2027, 8, 6) }

      it { is_expected.to eq(12) }
    end
  end
end

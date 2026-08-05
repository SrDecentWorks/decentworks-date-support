# frozen_string_literal: true

require "date"

require "active_support"
require "active_support/core_ext"
require "active_support/time"

require "spec_helper"
require "decentworks/date_support"

RSpec.describe ::Decentworks::DateSupport do
  using ::Decentworks::DateSupport

  let(:instance) { ::Date.new(2026, 8, 5) }

  before do
    ::Date.beginning_of_week = :monday # 週は月曜日始まり
  end

  describe "#beginning_of_this_week" do
    subject { instance.beginning_of_this_week(beginning_of_week) }

    let(:beginning_of_week) { nil }

    context "引数での週の始まりの曜日設定なし（月曜日始まり）" do
      let(:beginning_of_week) { nil }

      it { is_expected.to eq ::Date.new(2026, 8, 3) }
    end

    context "引数での週の始まりの曜日設定あり（日曜日始まり）" do
      let(:beginning_of_week) { :sunday }

      it { is_expected.to eq ::Date.new(2026, 8, 2) }
    end
  end

  describe "#end_of_this_week" do
    subject { instance.end_of_this_week(beginning_of_week) }

    let(:beginning_of_week) { nil }

    context "引数での週の始まりの曜日設定なし（月曜日始まり）" do
      let(:beginning_of_week) { nil }

      it { is_expected.to eq ::Date.new(2026, 8, 9) }
    end

    context "引数での週の始まりの曜日設定あり（日曜日始まり）" do
      let(:beginning_of_week) { :sunday }

      it { is_expected.to eq ::Date.new(2026, 8, 8) }
    end
  end

  describe "#all_this_week" do
    subject { instance.all_this_week(beginning_of_week) }

    let(:beginning_of_week) { nil }

    context "引数での週の始まりの曜日設定なし（月曜日始まり）" do
      let(:beginning_of_week) { nil }

      it { is_expected.to eq ::Range.new(::Date.new(2026, 8, 3), ::Date.new(2026, 8, 9)) }
    end

    context "引数での週の始まりの曜日設定あり（日曜日始まり）" do
      let(:beginning_of_week) { :sunday }

      it { is_expected.to eq ::Range.new(::Date.new(2026, 8, 2), ::Date.new(2026, 8, 8)) }
    end
  end

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

  describe "#beginning_of_february" do
    subject { instance.beginning_of_february }

    it { is_expected.to eq ::Date.new(2026, 2, 1) }
  end

  describe "#end_of_february" do
    subject { instance.end_of_february }

    it { is_expected.to eq ::Date.new(2026, 2, 28) }
  end

  describe "#all_february" do
    subject { instance.all_february }

    let(:beginning_of_february) { instance.beginning_of_february }
    let(:end_of_february) { instance.end_of_february }

    it { is_expected.to eq ::Range.new(beginning_of_february, end_of_february) }
  end

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

  describe "#beginning_of_first_quarter" do
    subject { instance.beginning_of_first_quarter }

    it { is_expected.to eq instance.beginning_of_january }
  end

  describe "#end_of_first_quarter" do
    subject { instance.end_of_first_quarter }

    it { is_expected.to eq instance.end_of_march }
  end

  describe "#all_first_quarter" do
    subject { instance.all_first_quarter }

    let(:beginning_of_first_quarter) { instance.beginning_of_first_quarter }
    let(:end_of_first_quarter) { instance.end_of_first_quarter }

    it { is_expected.to eq ::Range.new(beginning_of_first_quarter, end_of_first_quarter) }
  end

  describe "#beginning_of_second_quarter" do
    subject { instance.beginning_of_second_quarter }

    it { is_expected.to eq instance.beginning_of_april }
  end

  describe "#end_of_second_quarter" do
    subject { instance.end_of_second_quarter }

    it { is_expected.to eq instance.end_of_june }
  end

  describe "#all_second_quarter" do
    subject { instance.all_second_quarter }

    let(:beginning_of_second_quarter) { instance.beginning_of_second_quarter }
    let(:end_of_second_quarter) { instance.end_of_second_quarter }

    it { is_expected.to eq ::Range.new(beginning_of_second_quarter, end_of_second_quarter) }
  end

  describe "#beginning_of_third_quarter" do
    subject { instance.beginning_of_third_quarter }

    it { is_expected.to eq instance.beginning_of_july }
  end

  describe "#end_of_third_quarter" do
    subject { instance.end_of_third_quarter }

    it { is_expected.to eq instance.end_of_september }
  end

  describe "#all_third_quarter" do
    subject { instance.all_third_quarter }

    let(:beginning_of_third_quarter) { instance.beginning_of_third_quarter }
    let(:end_of_third_quarter) { instance.end_of_third_quarter }

    it { is_expected.to eq ::Range.new(beginning_of_third_quarter, end_of_third_quarter) }
  end

  describe "#beginning_of_fourth_quarter" do
    subject { instance.beginning_of_fourth_quarter }

    it { is_expected.to eq instance.beginning_of_october }
  end

  describe "#end_of_fourth_quarter" do
    subject { instance.end_of_fourth_quarter }

    it { is_expected.to eq instance.end_of_december }
  end

  describe "#all_fourth_quarter" do
    subject { instance.all_fourth_quarter }

    let(:beginning_of_fourth_quarter) { instance.beginning_of_fourth_quarter }
    let(:end_of_fourth_quarter) { instance.end_of_fourth_quarter }

    it { is_expected.to eq ::Range.new(beginning_of_fourth_quarter, end_of_fourth_quarter) }
  end

  describe "#beginning_of_fourth_quarter" do
    subject { instance.beginning_of_fourth_quarter }

    it { is_expected.to eq instance.beginning_of_october }
  end

  describe "#end_of_fourth_quarter" do
    subject { instance.end_of_fourth_quarter }

    it { is_expected.to eq instance.end_of_december }
  end

  describe "#all_fourth_quarter" do
    subject { instance.all_fourth_quarter }

    let(:beginning_of_fourth_quarter) { instance.beginning_of_fourth_quarter }
    let(:end_of_fourth_quarter) { instance.end_of_fourth_quarter }

    it { is_expected.to eq ::Range.new(beginning_of_fourth_quarter, end_of_fourth_quarter) }
  end

  describe "#beginning_of_first_half" do
    subject { instance.beginning_of_first_half }

    it { is_expected.to eq instance.beginning_of_first_quarter }
  end

  describe "#end_of_first_half" do
    subject { instance.end_of_first_half }

    it { is_expected.to eq instance.end_of_second_quarter }
  end

  describe "#all_first_half" do
    subject { instance.all_first_half }

    let(:beginning_of_first_half) { instance.beginning_of_first_half }
    let(:end_of_first_half) { instance.end_of_first_half }

    it { is_expected.to eq ::Range.new(beginning_of_first_half, end_of_first_half) }
  end

  describe "#beginning_of_second_half" do
    subject { instance.beginning_of_second_half }

    it { is_expected.to eq instance.beginning_of_third_quarter }
  end

  describe "#end_of_second_half" do
    subject { instance.end_of_second_half }

    it { is_expected.to eq instance.end_of_fourth_quarter }
  end

  describe "#all_second_half" do
    subject { instance.all_second_half }

    let(:beginning_of_second_half) { instance.beginning_of_second_half }
    let(:end_of_second_half) { instance.end_of_second_half }

    it { is_expected.to eq ::Range.new(beginning_of_second_half, end_of_second_half) }
  end

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

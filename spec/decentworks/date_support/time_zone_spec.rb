# frozen_string_literal: true

require "spec_helper"

# サマータイム（DST）のあるタイムゾーンでの振る舞い
RSpec.describe ::ActiveSupport::TimeWithZone do
  before { ::Time.zone = "America/New_York" }

  # -05:00（標準時）
  let(:standard_offset) { -5 * 60 * 60 }
  # -04:00（夏時間）
  let(:daylight_offset) { -4 * 60 * 60 }

  context "DST開始日（2026-03-08）を起点とする場合" do
    let(:instance) { ::Time.zone.local(2026, 3, 8, 12, 0, 0) }

    describe "#beginning_of_this_week" do
      subject { instance.beginning_of_this_week }

      it { is_expected.to eq ::Time.zone.local(2026, 3, 2).beginning_of_day }
      it { expect(subject.utc_offset).to eq standard_offset }
    end

    describe "#end_of_this_week" do
      subject { instance.end_of_this_week }

      it { is_expected.to eq ::Time.zone.local(2026, 3, 8).end_of_day }
      it { expect(subject.utc_offset).to eq daylight_offset }
    end

    describe "#all_this_week" do
      subject { instance.all_this_week }

      it "DSTを跨いでもオフセットが異なる範囲になる" do
        expect(subject.first.utc_offset).to eq standard_offset
        expect(subject.last.utc_offset).to eq daylight_offset
      end
    end

    describe "#all_this_month" do
      subject { instance.all_this_month }

      it do
        expect(subject).to eq ::Range.new(
          ::Time.zone.local(2026, 3, 1).beginning_of_day,
          ::Time.zone.local(2026, 3, 31).end_of_day
        )
      end
    end
  end

  context "DST期間中（2026-03-10）を起点とする場合" do
    let(:instance) { ::Time.zone.local(2026, 3, 10, 12, 0, 0) }

    describe "#beginning_of_this_week" do
      subject { instance.beginning_of_this_week }

      it { is_expected.to eq ::Time.zone.local(2026, 3, 9).beginning_of_day }
      it { expect(subject.utc_offset).to eq daylight_offset }
    end

    describe "#end_of_this_week" do
      subject { instance.end_of_this_week }

      it { is_expected.to eq ::Time.zone.local(2026, 3, 15).end_of_day }
      it { expect(subject.utc_offset).to eq daylight_offset }
    end
  end

  context "DST終了日（2026-11-01）を起点とする場合" do
    let(:instance) { ::Time.zone.local(2026, 11, 1, 12, 0, 0) }

    describe "#beginning_of_this_week" do
      subject { instance.beginning_of_this_week }

      it { is_expected.to eq ::Time.zone.local(2026, 10, 26).beginning_of_day }
      it { expect(subject.utc_offset).to eq daylight_offset }
    end

    describe "#end_of_this_week" do
      subject { instance.end_of_this_week }

      it { is_expected.to eq ::Time.zone.local(2026, 11, 1).end_of_day }
      it { expect(subject.utc_offset).to eq standard_offset }
    end

    describe "#all_this_month" do
      subject { instance.all_this_month }

      it "月初は夏時間、月末は標準時になる" do
        expect(subject.first.utc_offset).to eq daylight_offset
        expect(subject.last.utc_offset).to eq standard_offset
      end
    end

    describe "#in_november?" do
      subject { instance.in_november? }

      it { is_expected.to be true }
    end
  end

  context "DSTを跨ぐ期間を扱う場合" do
    let(:instance) { ::Time.zone.local(2026, 6, 15, 12, 0, 0) }

    describe "#beginning_of_first_quarter" do
      subject { instance.beginning_of_first_quarter }

      it { is_expected.to eq ::Time.zone.local(2026, 1, 1).beginning_of_day }
      it { expect(subject.utc_offset).to eq standard_offset }
    end

    describe "#end_of_fourth_quarter" do
      subject { instance.end_of_fourth_quarter }

      it { is_expected.to eq ::Time.zone.local(2026, 12, 31).end_of_day }
      it { expect(subject.utc_offset).to eq standard_offset }
    end

    describe "#all_first_half" do
      subject { instance.all_first_half }

      it "期首は標準時、期末は夏時間になる" do
        expect(subject.first.utc_offset).to eq standard_offset
        expect(subject.last.utc_offset).to eq daylight_offset
      end
    end

    describe "#end_of_march" do
      subject { instance.end_of_march }

      it { is_expected.to eq ::Time.zone.local(2026, 3, 31).end_of_day }
      it { expect(subject.utc_offset).to eq daylight_offset }
    end
  end
end

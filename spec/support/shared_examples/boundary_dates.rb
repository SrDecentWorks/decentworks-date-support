# frozen_string_literal: true

# 月末・閏日・年またぎなど境界となる日付を起点とした場合の振る舞い
#
# includeする側で `let(:time)` / `let(:day_beginning)` / `let(:day_end)` を定義すること。
RSpec.shared_examples "境界日" do
  context "月末（2026-01-31）を起点とする場合" do
    let(:instance) { time.call(2026, 1, 31, 12, 34, 56) }

    describe "#all_this_week" do
      subject { instance.all_this_week }

      it { is_expected.to eq ::Range.new(day_beginning.call(2026, 1, 26), day_end.call(2026, 2, 1)) }
    end

    describe "#all_this_month" do
      subject { instance.all_this_month }

      it { is_expected.to eq ::Range.new(day_beginning.call(2026, 1, 1), day_end.call(2026, 1, 31)) }
    end

    describe "#two_months_since" do
      subject { instance.two_months_since }

      it { is_expected.to eq time.call(2026, 3, 31, 12, 34, 56) }
    end

    describe "#three_months_since（応当日のない4月）" do
      subject { instance.three_months_since }

      it { is_expected.to eq time.call(2026, 4, 30, 12, 34, 56) }
    end

    describe "#two_months_ago" do
      subject { instance.two_months_ago }

      it { is_expected.to eq time.call(2025, 11, 30, 12, 34, 56) }
    end

    describe "#end_of_first_quarter" do
      subject { instance.end_of_first_quarter }

      it { is_expected.to eq day_end.call(2026, 3, 31) }
    end

    describe "#end_of_january?" do
      subject { instance.end_of_january? }

      it { is_expected.to be true }
    end
  end

  context "閏日（2024-02-29）を起点とする場合" do
    let(:instance) { time.call(2024, 2, 29, 12, 34, 56) }

    describe "#all_this_week" do
      subject { instance.all_this_week }

      it { is_expected.to eq ::Range.new(day_beginning.call(2024, 2, 26), day_end.call(2024, 3, 3)) }
    end

    describe "#all_this_month" do
      subject { instance.all_this_month }

      it { is_expected.to eq ::Range.new(day_beginning.call(2024, 2, 1), day_end.call(2024, 2, 29)) }
    end

    describe "#all_february" do
      subject { instance.all_february }

      it { is_expected.to eq ::Range.new(day_beginning.call(2024, 2, 1), day_end.call(2024, 2, 29)) }
    end

    describe "#two_months_since" do
      subject { instance.two_months_since }

      it { is_expected.to eq time.call(2024, 4, 29, 12, 34, 56) }
    end

    describe "#two_months_ago" do
      subject { instance.two_months_ago }

      it { is_expected.to eq time.call(2023, 12, 29, 12, 34, 56) }
    end

    describe "#end_of_february?" do
      subject { instance.end_of_february? }

      it { is_expected.to be true }
    end

    describe "#in_february?" do
      subject { instance.in_february? }

      it { is_expected.to be true }
    end
  end

  context "年末（2026-12-31）を起点とする場合" do
    let(:instance) { time.call(2026, 12, 31, 12, 34, 56) }

    describe "#all_this_week（年をまたぐ）" do
      subject { instance.all_this_week }

      it { is_expected.to eq ::Range.new(day_beginning.call(2026, 12, 28), day_end.call(2027, 1, 3)) }
    end

    describe "#two_months_since（応当日のない2月）" do
      subject { instance.two_months_since }

      it { is_expected.to eq time.call(2027, 2, 28, 12, 34, 56) }
    end

    describe "#end_of_december?" do
      subject { instance.end_of_december? }

      it { is_expected.to be true }
    end

    describe "#end_of_fourth_quarter?" do
      subject { instance.end_of_fourth_quarter? }

      it { is_expected.to be true }
    end

    describe "#in_second_half?" do
      subject { instance.in_second_half? }

      it { is_expected.to be true }
    end
  end

  context "年始（2026-01-01）を起点とする場合" do
    let(:instance) { time.call(2026, 1, 1, 12, 34, 56) }

    describe "#all_this_week（年をまたぐ）" do
      subject { instance.all_this_week }

      it { is_expected.to eq ::Range.new(day_beginning.call(2025, 12, 29), day_end.call(2026, 1, 4)) }
    end

    describe "#two_months_ago" do
      subject { instance.two_months_ago }

      it { is_expected.to eq time.call(2025, 11, 1, 12, 34, 56) }
    end

    describe "#beginning_of_january?" do
      subject { instance.beginning_of_january? }

      it { is_expected.to be true }
    end

    describe "#beginning_of_first_quarter?" do
      subject { instance.beginning_of_first_quarter? }

      it { is_expected.to be true }
    end

    describe "#in_first_half?" do
      subject { instance.in_first_half? }

      it { is_expected.to be true }
    end
  end

  context "期末（2026-03-31）を起点とし4月始まりの場合" do
    before do
      ::Decentworks::DateSupport.configure do |config|
        config.first_quarter_month_name = :april
      end
    end

    let(:instance) { time.call(2026, 3, 31, 12, 34, 56) }

    describe "#first_quarter_month_name" do
      subject { instance.beginning_of_first_quarter }

      it { is_expected.to eq day_beginning.call(2025, 4, 1) }
    end

    describe "#end_of_fourth_quarter" do
      subject { instance.end_of_fourth_quarter }

      it { is_expected.to eq day_end.call(2026, 3, 31) }
    end

    describe "#in_fourth_quarter?" do
      subject { instance.in_fourth_quarter? }

      it { is_expected.to be true }
    end

    describe "#all_second_half" do
      subject { instance.all_second_half }

      it { is_expected.to eq ::Range.new(day_beginning.call(2025, 10, 1), day_end.call(2026, 3, 31)) }
    end

    describe "#in_second_half?" do
      subject { instance.in_second_half? }

      it { is_expected.to be true }
    end
  end
end

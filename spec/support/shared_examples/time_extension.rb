# frozen_string_literal: true

# ::Time / ::DateTime / ::ActiveSupport::TimeWithZone 共通の振る舞い
#
# includeする側で、年月日時分秒を受け取って対象クラスのインスタンスを返す
# lambda を `let(:time)` として定義すること。

RSpec.shared_examples "日時拡張" do
  let(:instance) { time.call(2026, 8, 5, 12, 34, 56) }

  # ###################################################################################################################
  # 週関係
  # ###################################################################################################################

  describe "#beginning_of_this_week" do
    subject { instance.beginning_of_this_week }

    it { is_expected.to eq time.call(2026, 8, 3).beginning_of_day }
  end

  describe "#end_of_this_week" do
    subject { instance.end_of_this_week }

    it { is_expected.to eq time.call(2026, 8, 9).end_of_day }
  end

  describe "#all_this_week" do
    subject { instance.all_this_week }

    it { is_expected.to eq ::Range.new(time.call(2026, 8, 3).beginning_of_day, time.call(2026, 8, 9).end_of_day) }
  end

  # ###################################################################################################################
  # 月関係
  # ###################################################################################################################

  describe "#beginning_of_this_month" do
    subject { instance.beginning_of_this_month }

    it { is_expected.to eq time.call(2026, 8, 1).beginning_of_day }
  end

  describe "#end_of_this_month" do
    subject { instance.end_of_this_month }

    it { is_expected.to eq time.call(2026, 8, 31).end_of_day }
  end

  describe "#all_this_month" do
    subject { instance.all_this_month }

    it { is_expected.to eq ::Range.new(time.call(2026, 8, 1).beginning_of_day, time.call(2026, 8, 31).end_of_day) }
  end

  describe "#two_months_ago" do
    subject { instance.two_months_ago }

    it { is_expected.to eq time.call(2026, 6, 5, 12, 34, 56) }
  end

  describe "#three_months_ago" do
    subject { instance.three_months_ago }

    it { is_expected.to eq time.call(2026, 5, 5, 12, 34, 56) }
  end

  describe "#four_months_ago" do
    subject { instance.four_months_ago }

    it { is_expected.to eq time.call(2026, 4, 5, 12, 34, 56) }
  end

  describe "#five_months_ago" do
    subject { instance.five_months_ago }

    it { is_expected.to eq time.call(2026, 3, 5, 12, 34, 56) }
  end

  describe "#six_months_ago" do
    subject { instance.six_months_ago }

    it { is_expected.to eq time.call(2026, 2, 5, 12, 34, 56) }
  end

  describe "#half_year_ago" do
    subject { instance.half_year_ago }

    it { is_expected.to eq time.call(2026, 2, 5, 12, 34, 56) }
  end

  describe "#seven_months_ago" do
    subject { instance.seven_months_ago }

    it { is_expected.to eq time.call(2026, 1, 5, 12, 34, 56) }
  end

  describe "#eight_months_ago" do
    subject { instance.eight_months_ago }

    it { is_expected.to eq time.call(2025, 12, 5, 12, 34, 56) }
  end

  describe "#nine_months_ago" do
    subject { instance.nine_months_ago }

    it { is_expected.to eq time.call(2025, 11, 5, 12, 34, 56) }
  end

  describe "#ten_months_ago" do
    subject { instance.ten_months_ago }

    it { is_expected.to eq time.call(2025, 10, 5, 12, 34, 56) }
  end

  describe "#eleven_months_ago" do
    subject { instance.eleven_months_ago }

    it { is_expected.to eq time.call(2025, 9, 5, 12, 34, 56) }
  end

  describe "#two_months_since" do
    subject { instance.two_months_since }

    it { is_expected.to eq time.call(2026, 10, 5, 12, 34, 56) }
  end

  describe "#three_months_since" do
    subject { instance.three_months_since }

    it { is_expected.to eq time.call(2026, 11, 5, 12, 34, 56) }
  end

  describe "#four_months_since" do
    subject { instance.four_months_since }

    it { is_expected.to eq time.call(2026, 12, 5, 12, 34, 56) }
  end

  describe "#five_months_since" do
    subject { instance.five_months_since }

    it { is_expected.to eq time.call(2027, 1, 5, 12, 34, 56) }
  end

  describe "#six_months_since" do
    subject { instance.six_months_since }

    it { is_expected.to eq time.call(2027, 2, 5, 12, 34, 56) }
  end

  describe "#half_year_since" do
    subject { instance.half_year_since }

    it { is_expected.to eq time.call(2027, 2, 5, 12, 34, 56) }
  end

  describe "#seven_months_since" do
    subject { instance.seven_months_since }

    it { is_expected.to eq time.call(2027, 3, 5, 12, 34, 56) }
  end

  describe "#eight_months_since" do
    subject { instance.eight_months_since }

    it { is_expected.to eq time.call(2027, 4, 5, 12, 34, 56) }
  end

  describe "#nine_months_since" do
    subject { instance.nine_months_since }

    it { is_expected.to eq time.call(2027, 5, 5, 12, 34, 56) }
  end

  describe "#ten_months_since" do
    subject { instance.ten_months_since }

    it { is_expected.to eq time.call(2027, 6, 5, 12, 34, 56) }
  end

  describe "#eleven_months_since" do
    subject { instance.eleven_months_since }

    it { is_expected.to eq time.call(2027, 7, 5, 12, 34, 56) }
  end

  #
  # 1月
  #

  describe "#beginning_of_january" do
    subject { instance.beginning_of_january }

    it { is_expected.to eq time.call(2026, 1, 1).beginning_of_day }
  end

  describe "#end_of_january" do
    subject { instance.end_of_january }

    it { is_expected.to eq time.call(2026, 1, 31).end_of_day }
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
      let(:instance) { time.call(2026, 1, 1, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "月初以外" do
      let(:instance) { time.call(2026, 1, 2, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#end_of_january?" do
    subject { instance.end_of_january? }

    context "月末" do
      let(:instance) { time.call(2026, 1, 31, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "月末以外" do
      let(:instance) { time.call(2026, 2, 1, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#in_january?" do
    subject { instance.in_january? }

    context "1月ではない（前月月末）" do
      let(:instance) { time.call(2025, 12, 31, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end

    context "1月月初" do
      let(:instance) { time.call(2026, 1, 1, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "1月中旬" do
      let(:instance) { time.call(2026, 1, 15, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "1月月末" do
      let(:instance) { time.call(2026, 1, 31, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "1月ではない（翌月月初）" do
      let(:instance) { time.call(2026, 2, 1, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end
  end

  #
  # 2月
  #

  describe "#beginning_of_february" do
    subject { instance.beginning_of_february }

    it { is_expected.to eq time.call(2026, 2, 1).beginning_of_day }
  end

  describe "#end_of_february" do
    subject { instance.end_of_february }

    it { is_expected.to eq time.call(2026, 2, 28).end_of_day }
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
      let(:instance) { time.call(2026, 2, 1, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "月初以外" do
      let(:instance) { time.call(2026, 2, 2, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#end_of_february?" do
    subject { instance.end_of_february? }

    context "月末" do
      let(:instance) { time.call(2026, 2, 28, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "月末以外" do
      let(:instance) { time.call(2026, 3, 1, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#in_february?" do
    subject { instance.in_february? }

    context "1月ではない（前月月末）" do
      let(:instance) { time.call(2026, 1, 31, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end

    context "2月月初" do
      let(:instance) { time.call(2026, 2, 1, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "2月中旬" do
      let(:instance) { time.call(2026, 2, 15, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "2月月末" do
      let(:instance) { time.call(2026, 2, 28, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "2月ではない（翌月月初）" do
      let(:instance) { time.call(2026, 3, 1, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end
  end

  #
  # 3月
  #

  describe "#beginning_of_march" do
    subject { instance.beginning_of_march }

    it { is_expected.to eq time.call(2026, 3, 1).beginning_of_day }
  end

  describe "#end_of_march" do
    subject { instance.end_of_march }

    it { is_expected.to eq time.call(2026, 3, 31).end_of_day }
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
      let(:instance) { time.call(2026, 3, 1, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "月初以外" do
      let(:instance) { time.call(2026, 3, 2, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#end_of_march?" do
    subject { instance.end_of_march? }

    context "月末" do
      let(:instance) { time.call(2026, 3, 31, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "月末以外" do
      let(:instance) { time.call(2026, 4, 1, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#in_march?" do
    subject { instance.in_march? }

    context "3月ではない（前月月末）" do
      let(:instance) { time.call(2026, 2, 28, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end

    context "3月月初" do
      let(:instance) { time.call(2026, 3, 1, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "3月中旬" do
      let(:instance) { time.call(2026, 3, 15, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "3月月末" do
      let(:instance) { time.call(2026, 3, 31, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "3月ではない（翌月月初）" do
      let(:instance) { time.call(2026, 4, 1, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end
  end

  #
  # 4月
  #

  describe "#beginning_of_april" do
    subject { instance.beginning_of_april }

    it { is_expected.to eq time.call(2026, 4, 1).beginning_of_day }
  end

  describe "#end_of_april" do
    subject { instance.end_of_april }

    it { is_expected.to eq time.call(2026, 4, 30).end_of_day }
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
      let(:instance) { time.call(2026, 4, 1, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "月初以外" do
      let(:instance) { time.call(2026, 4, 2, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#end_of_april?" do
    subject { instance.end_of_april? }

    context "月末" do
      let(:instance) { time.call(2026, 4, 30, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "月末以外" do
      let(:instance) { time.call(2026, 5, 1, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#in_april?" do
    subject { instance.in_april? }

    context "4月ではない（前月月末）" do
      let(:instance) { time.call(2026, 3, 31, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end

    context "4月月初" do
      let(:instance) { time.call(2026, 4, 1, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "4月中旬" do
      let(:instance) { time.call(2026, 4, 15, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "4月月末" do
      let(:instance) { time.call(2026, 4, 30, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "4月ではない（翌月月初）" do
      let(:instance) { time.call(2026, 5, 1, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end
  end

  #
  # 5月
  #

  describe "#beginning_of_may" do
    subject { instance.beginning_of_may }

    it { is_expected.to eq time.call(2026, 5, 1).beginning_of_day }
  end

  describe "#end_of_may" do
    subject { instance.end_of_may }

    it { is_expected.to eq time.call(2026, 5, 31).end_of_day }
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
      let(:instance) { time.call(2026, 5, 1, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "月初以外" do
      let(:instance) { time.call(2026, 5, 2, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#end_of_may?" do
    subject { instance.end_of_may? }

    context "月末" do
      let(:instance) { time.call(2026, 5, 31, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "月末以外" do
      let(:instance) { time.call(2026, 6, 1, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#in_may?" do
    subject { instance.in_may? }

    context "5月ではない（前月月末）" do
      let(:instance) { time.call(2026, 4, 30, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end

    context "5月月初" do
      let(:instance) { time.call(2026, 5, 1, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "5月中旬" do
      let(:instance) { time.call(2026, 5, 15, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "5月月末" do
      let(:instance) { time.call(2026, 5, 31, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "5月ではない（翌月月初）" do
      let(:instance) { time.call(2026, 6, 1, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end
  end

  #
  # 6月
  #

  describe "#beginning_of_june" do
    subject { instance.beginning_of_june }

    it { is_expected.to eq time.call(2026, 6, 1).beginning_of_day }
  end

  describe "#end_of_june" do
    subject { instance.end_of_june }

    it { is_expected.to eq time.call(2026, 6, 30).end_of_day }
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
      let(:instance) { time.call(2026, 6, 1, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "月初以外" do
      let(:instance) { time.call(2026, 6, 2, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#end_of_june?" do
    subject { instance.end_of_june? }

    context "月末" do
      let(:instance) { time.call(2026, 6, 30, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "月末以外" do
      let(:instance) { time.call(2026, 7, 1, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#in_june?" do
    subject { instance.in_june? }

    context "6月ではない（前月月末）" do
      let(:instance) { time.call(2026, 5, 31, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end

    context "6月月初" do
      let(:instance) { time.call(2026, 6, 1, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "6月中旬" do
      let(:instance) { time.call(2026, 6, 15, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "6月月末" do
      let(:instance) { time.call(2026, 6, 30, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "6月ではない（翌月月初）" do
      let(:instance) { time.call(2026, 7, 1, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end
  end

  #
  # 7月
  #

  describe "#beginning_of_july" do
    subject { instance.beginning_of_july }

    it { is_expected.to eq time.call(2026, 7, 1).beginning_of_day }
  end

  describe "#end_of_july" do
    subject { instance.end_of_july }

    it { is_expected.to eq time.call(2026, 7, 31).end_of_day }
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
      let(:instance) { time.call(2026, 7, 1, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "月初以外" do
      let(:instance) { time.call(2026, 7, 2, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#end_of_july?" do
    subject { instance.end_of_july? }

    context "月末" do
      let(:instance) { time.call(2026, 7, 31, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "月末以外" do
      let(:instance) { time.call(2026, 8, 1, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#in_july?" do
    subject { instance.in_july? }

    context "7月ではない（前月月末）" do
      let(:instance) { time.call(2026, 6, 30, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end

    context "7月月初" do
      let(:instance) { time.call(2026, 7, 1, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "7月中旬" do
      let(:instance) { time.call(2026, 7, 15, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "7月月末" do
      let(:instance) { time.call(2026, 7, 31, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "7月ではない（翌月月初）" do
      let(:instance) { time.call(2026, 8, 1, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end
  end

  #
  # 8月
  #

  describe "#beginning_of_august" do
    subject { instance.beginning_of_august }

    it { is_expected.to eq time.call(2026, 8, 1).beginning_of_day }
  end

  describe "#end_of_august" do
    subject { instance.end_of_august }

    it { is_expected.to eq time.call(2026, 8, 31).end_of_day }
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
      let(:instance) { time.call(2026, 8, 1, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "月初以外" do
      let(:instance) { time.call(2026, 8, 2, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#end_of_august?" do
    subject { instance.end_of_august? }

    context "月末" do
      let(:instance) { time.call(2026, 8, 31, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "月末以外" do
      let(:instance) { time.call(2026, 9, 1, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#in_august?" do
    subject { instance.in_august? }

    context "8月ではない（前月月末）" do
      let(:instance) { time.call(2026, 7, 31, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end

    context "8月月初" do
      let(:instance) { time.call(2026, 8, 1, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "8月中旬" do
      let(:instance) { time.call(2026, 8, 15, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "8月月末" do
      let(:instance) { time.call(2026, 8, 31, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "8月ではない（翌月月初）" do
      let(:instance) { time.call(2026, 9, 1, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end
  end

  #
  # 9月
  #

  describe "#beginning_of_september" do
    subject { instance.beginning_of_september }

    it { is_expected.to eq time.call(2026, 9, 1).beginning_of_day }
  end

  describe "#end_of_september" do
    subject { instance.end_of_september }

    it { is_expected.to eq time.call(2026, 9, 30).end_of_day }
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
      let(:instance) { time.call(2026, 9, 1, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "月初以外" do
      let(:instance) { time.call(2026, 9, 2, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#end_of_september?" do
    subject { instance.end_of_september? }

    context "月末" do
      let(:instance) { time.call(2026, 9, 30, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "月末以外" do
      let(:instance) { time.call(2026, 10, 1, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#in_september?" do
    subject { instance.in_september? }

    context "9月ではない（前月月末）" do
      let(:instance) { time.call(2026, 8, 31, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end

    context "9月月初" do
      let(:instance) { time.call(2026, 9, 1, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "9月中旬" do
      let(:instance) { time.call(2026, 9, 15, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "9月月末" do
      let(:instance) { time.call(2026, 9, 30, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "9月ではない（翌月月初）" do
      let(:instance) { time.call(2026, 10, 1, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end
  end

  #
  # 10月
  #

  describe "#beginning_of_october" do
    subject { instance.beginning_of_october }

    it { is_expected.to eq time.call(2026, 10, 1).beginning_of_day }
  end

  describe "#end_of_october" do
    subject { instance.end_of_october }

    it { is_expected.to eq time.call(2026, 10, 31).end_of_day }
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
      let(:instance) { time.call(2026, 10, 1, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "月初以外" do
      let(:instance) { time.call(2026, 10, 2, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#end_of_october?" do
    subject { instance.end_of_october? }

    context "月末" do
      let(:instance) { time.call(2026, 10, 31, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "月末以外" do
      let(:instance) { time.call(2026, 11, 1, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#in_october?" do
    subject { instance.in_october? }

    context "10月ではない（前月月末）" do
      let(:instance) { time.call(2026, 9, 30, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end

    context "10月月初" do
      let(:instance) { time.call(2026, 10, 1, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "10月中旬" do
      let(:instance) { time.call(2026, 10, 15, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "10月月末" do
      let(:instance) { time.call(2026, 10, 31, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "10月ではない（翌月月初）" do
      let(:instance) { time.call(2026, 11, 1, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end
  end

  #
  # 11月
  #

  describe "#beginning_of_november" do
    subject { instance.beginning_of_november }

    it { is_expected.to eq time.call(2026, 11, 1).beginning_of_day }
  end

  describe "#end_of_november" do
    subject { instance.end_of_november }

    it { is_expected.to eq time.call(2026, 11, 30).end_of_day }
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
      let(:instance) { time.call(2026, 11, 1, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "月初以外" do
      let(:instance) { time.call(2026, 11, 2, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#end_of_november?" do
    subject { instance.end_of_november? }

    context "月末" do
      let(:instance) { time.call(2026, 11, 30, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "月末以外" do
      let(:instance) { time.call(2026, 12, 1, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#in_november?" do
    subject { instance.in_november? }

    context "11月ではない（前月月末）" do
      let(:instance) { time.call(2026, 10, 31, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end

    context "11月月初" do
      let(:instance) { time.call(2026, 11, 1, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "11月中旬" do
      let(:instance) { time.call(2026, 11, 15, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "11月月末" do
      let(:instance) { time.call(2026, 11, 30, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "11月ではない（翌月月初）" do
      let(:instance) { time.call(2026, 12, 1, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end
  end

  #
  # 2月
  #

  describe "#beginning_of_december" do
    subject { instance.beginning_of_december }

    it { is_expected.to eq time.call(2026, 12, 1).beginning_of_day }
  end

  describe "#end_of_december" do
    subject { instance.end_of_december }

    it { is_expected.to eq time.call(2026, 12, 31).end_of_day }
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
      let(:instance) { time.call(2026, 12, 1, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "月初以外" do
      let(:instance) { time.call(2026, 12, 2, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#end_of_december?" do
    subject { instance.end_of_december? }

    context "月末" do
      let(:instance) { time.call(2026, 12, 31, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "月末以外" do
      let(:instance) { time.call(2027, 1, 1, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#in_december?" do
    subject { instance.in_december? }

    context "12月ではない（前月月末）" do
      let(:instance) { time.call(2026, 11, 30, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end

    context "12月月初" do
      let(:instance) { time.call(2026, 12, 1, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "12月中旬" do
      let(:instance) { time.call(2026, 12, 15, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "12月月末" do
      let(:instance) { time.call(2026, 12, 31, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "12月ではない（翌月月初）" do
      let(:instance) { time.call(2027, 1, 1, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end
  end

  # ###################################################################################################################
  # 四半期関係
  # ###################################################################################################################

  #
  # 第1四半期
  #

  describe "#first_quarter_month_name" do
    subject { instance.beginning_of_first_quarter }

    context "1月始まりの場合（初期値）" do
      it { is_expected.to eq time.call(2026, 1, 1).beginning_of_day }
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :april
        end
      end

      it { is_expected.to eq time.call(2026, 4, 1).beginning_of_day }
    end
  end

  describe "#end_of_first_quarter" do
    subject { instance.end_of_first_quarter }

    context "1月始まりの場合（初期値）" do
      it { is_expected.to eq time.call(2026, 3, 31).end_of_day }
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :april
        end
      end

      it { is_expected.to eq time.call(2026, 6, 30).end_of_day }
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
        let(:instance) { time.call(2026, 1, 1, 12, 34, 56) }

        it { is_expected.to be_truthy }
      end

      context "期首以外" do
        let(:instance) { time.call(2026, 1, 2, 12, 34, 56) }

        it { is_expected.to be_falsey }
      end
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :april
        end
      end

      context "期首" do
        let(:instance) { time.call(2026, 4, 1, 12, 34, 56) }

        it { is_expected.to be_truthy }
      end

      context "期首以外" do
        let(:instance) { time.call(2026, 4, 2, 12, 34, 56) }

        it { is_expected.to be_falsey }
      end
    end
  end

  describe "#end_of_first_quarter?" do
    subject { instance.end_of_first_quarter? }

    context "1月始まりの場合（初期値）" do
      context "期末" do
        let(:instance) { time.call(2026, 3, 31, 12, 34, 56) }

        it { is_expected.to be_truthy }
      end

      context "期末以外" do
        let(:instance) { time.call(2026, 4, 1, 12, 34, 56) }

        it { is_expected.to be_falsey }
      end
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :april
        end
      end

      context "期末" do
        let(:instance) { time.call(2026, 6, 30, 12, 34, 56) }

        it { is_expected.to be_truthy }
      end

      context "期末以外" do
        let(:instance) { time.call(2026, 7, 1, 12, 34, 56) }

        it { is_expected.to be_falsey }
      end
    end
  end

  describe "#in_first_quarter?" do
    subject { instance.in_first_quarter? }

    context "第1四半期ではない（前期期末）" do
      let(:instance) { time.call(2025, 12, 31, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end

    context "第1四半期期首" do
      let(:instance) { time.call(2026, 1, 1, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "第1四半期中" do
      let(:instance) { time.call(2026, 2, 15, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "第1四半期末" do
      let(:instance) { time.call(2026, 3, 31, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "第1四半期ではない（翌期期首）" do
      let(:instance) { time.call(2026, 4, 1, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end
  end

  #
  # 第2四半期
  #

  describe "#beginning_of_second_quarter" do
    subject { instance.beginning_of_second_quarter }

    context "1月始まりの場合（初期値）" do
      it { is_expected.to eq time.call(2026, 4, 1).beginning_of_day }
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :april
        end
      end

      it { is_expected.to eq time.call(2026, 7, 1).beginning_of_day }
    end
  end

  describe "#end_of_second_quarter" do
    subject { instance.end_of_second_quarter }

    context "1月始まりの場合（初期値）" do
      it { is_expected.to eq time.call(2026, 6, 30).end_of_day }
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :april
        end
      end

      it { is_expected.to eq time.call(2026, 9, 30).end_of_day }
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
        let(:instance) { time.call(2026, 4, 1, 12, 34, 56) }

        it { is_expected.to be_truthy }
      end

      context "期首以外" do
        let(:instance) { time.call(2026, 4, 2, 12, 34, 56) }

        it { is_expected.to be_falsey }
      end
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :april
        end
      end

      context "期首" do
        let(:instance) { time.call(2026, 7, 1, 12, 34, 56) }

        it { is_expected.to be_truthy }
      end

      context "期首以外" do
        let(:instance) { time.call(2026, 7, 2, 12, 34, 56) }

        it { is_expected.to be_falsey }
      end
    end
  end

  describe "#end_of_second_quarter?" do
    subject { instance.end_of_second_quarter? }

    context "1月始まりの場合（初期値）" do
      context "期末" do
        let(:instance) { time.call(2026, 6, 30, 12, 34, 56) }

        it { is_expected.to be_truthy }
      end

      context "期末以外" do
        let(:instance) { time.call(2026, 7, 1, 12, 34, 56) }

        it { is_expected.to be_falsey }
      end
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :april
        end
      end

      context "期末" do
        let(:instance) { time.call(2026, 9, 30, 12, 34, 56) }

        it { is_expected.to be_truthy }
      end

      context "期末以外" do
        let(:instance) { time.call(2026, 10, 1, 12, 34, 56) }

        it { is_expected.to be_falsey }
      end
    end
  end

  describe "#in_second_quarter?" do
    subject { instance.in_second_quarter? }

    context "第2四半期ではない（前期期末）" do
      let(:instance) { time.call(2026, 3, 31, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end

    context "第2四半期期首" do
      let(:instance) { time.call(2026, 4, 1, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "第2四半期中" do
      let(:instance) { time.call(2026, 5, 15, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "第2四半期末" do
      let(:instance) { time.call(2026, 6, 30, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "第2四半期ではない（翌期期首）" do
      let(:instance) { time.call(2026, 7, 1, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end
  end

  #
  # 第3四半期
  #

  describe "#beginning_of_third_quarter" do
    subject { instance.beginning_of_third_quarter }

    context "1月始まりの場合（初期値）" do
      it { is_expected.to eq time.call(2026, 7, 1).beginning_of_day }
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :april
        end
      end

      it { is_expected.to eq time.call(2026, 10, 1).beginning_of_day }
    end
  end

  describe "#end_of_third_quarter" do
    subject { instance.end_of_third_quarter }

    context "1月始まりの場合（初期値）" do
      it { is_expected.to eq time.call(2026, 9, 30).end_of_day }
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :april
        end
      end

      it { is_expected.to eq time.call(2026, 12, 31).end_of_day }
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
        let(:instance) { time.call(2026, 7, 1, 12, 34, 56) }

        it { is_expected.to be_truthy }
      end

      context "期首以外" do
        let(:instance) { time.call(2026, 7, 2, 12, 34, 56) }

        it { is_expected.to be_falsey }
      end
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :april
        end
      end

      context "期首" do
        let(:instance) { time.call(2026, 10, 1, 12, 34, 56) }

        it { is_expected.to be_truthy }
      end

      context "期首以外" do
        let(:instance) { time.call(2026, 10, 2, 12, 34, 56) }

        it { is_expected.to be_falsey }
      end
    end
  end

  describe "#end_of_third_quarter?" do
    subject { instance.end_of_third_quarter? }

    context "1月始まりの場合（初期値）" do
      context "期末" do
        let(:instance) { time.call(2026, 9, 30, 12, 34, 56) }

        it { is_expected.to be_truthy }
      end

      context "期末以外" do
        let(:instance) { time.call(2026, 10, 1, 12, 34, 56) }

        it { is_expected.to be_falsey }
      end
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :april
        end
      end

      context "期末" do
        let(:instance) { time.call(2026, 12, 31, 12, 34, 56) }

        it { is_expected.to be_truthy }
      end

      context "期末以外" do
        let(:instance) { time.call(2027, 1, 1, 12, 34, 56) }

        it { is_expected.to be_falsey }
      end
    end
  end

  describe "#in_third_quarter?" do
    subject { instance.in_third_quarter? }

    context "第3四半期ではない（前期期末）" do
      let(:instance) { time.call(2026, 6, 30, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end

    context "第3四半期期首" do
      let(:instance) { time.call(2026, 7, 1, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "第3四半期中" do
      let(:instance) { time.call(2026, 8, 15, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "第3四半期末" do
      let(:instance) { time.call(2026, 9, 30, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "第3四半期ではない（翌期期首）" do
      let(:instance) { time.call(2026, 10, 1, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end
  end

  #
  # 第4四半期
  #

  describe "#beginning_of_fourth_quarter" do
    subject { instance.beginning_of_fourth_quarter }

    context "1月始まりの場合（初期値）" do
      it { is_expected.to eq time.call(2026, 10, 1).beginning_of_day }
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :april
        end
      end

      it { is_expected.to eq time.call(2027, 1, 1).beginning_of_day }
    end
  end

  describe "#end_of_fourth_quarter" do
    subject { instance.end_of_fourth_quarter }

    context "1月始まりの場合（初期値）" do
      it { is_expected.to eq time.call(2026, 12, 31).end_of_day }
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :april
        end
      end

      it { is_expected.to eq time.call(2027, 3, 31).end_of_day }
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
        let(:instance) { time.call(2026, 10, 1, 12, 34, 56) }

        it { is_expected.to be_truthy }
      end

      context "期首以外" do
        let(:instance) { time.call(2026, 10, 2, 12, 34, 56) }

        it { is_expected.to be_falsey }
      end
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :april
        end
      end

      context "期首" do
        let(:instance) { time.call(2027, 1, 1, 12, 34, 56) }

        it { is_expected.to be_truthy }
      end

      context "期首以外" do
        let(:instance) { time.call(2027, 1, 2, 12, 34, 56) }

        it { is_expected.to be_falsey }
      end
    end
  end

  describe "#end_of_fourth_quarter?" do
    subject { instance.end_of_fourth_quarter? }

    context "1月始まりの場合（初期値）" do
      context "期末" do
        let(:instance) { time.call(2026, 12, 31, 12, 34, 56) }

        it { is_expected.to be_truthy }
      end

      context "期末以外" do
        let(:instance) { time.call(2027, 1, 1, 12, 34, 56) }

        it { is_expected.to be_falsey }
      end
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :april
        end
      end

      context "期末" do
        let(:instance) { time.call(2027, 3, 31, 12, 34, 56) }

        it { is_expected.to be_truthy }
      end

      context "期末以外" do
        let(:instance) { time.call(2027, 4, 1, 12, 34, 56) }

        it { is_expected.to be_falsey }
      end
    end
  end

  describe "#in_fourth_quarter?" do
    subject { instance.in_fourth_quarter? }

    context "第4四半期ではない（前期期末）" do
      let(:instance) { time.call(2026, 9, 30, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end

    context "第4四半期期首" do
      let(:instance) { time.call(2026, 10, 1, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "第4四半期中" do
      let(:instance) { time.call(2026, 11, 15, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "第4四半期末" do
      let(:instance) { time.call(2026, 12, 31, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "第4四半期ではない（翌期期首）" do
      let(:instance) { time.call(2027, 1, 1, 12, 34, 56) }

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

  describe "#beginning_of_first_half?" do
    subject { instance.beginning_of_first_half? }

    context "期首" do
      let(:instance) { time.call(2026, 1, 1, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "期首以外" do
      let(:instance) { time.call(2026, 1, 2, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#end_of_first_half?" do
    subject { instance.end_of_first_half? }

    context "期末" do
      let(:instance) { time.call(2026, 6, 30, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "期末以外" do
      let(:instance) { time.call(2026, 7, 1, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#in_first_half?" do
    subject { instance.in_first_half? }

    context "上期ではない（前期期末）" do
      let(:instance) { time.call(2025, 12, 31, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end

    context "上期期首" do
      let(:instance) { time.call(2026, 1, 1, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "上期中" do
      let(:instance) { time.call(2026, 2, 15, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "上期末" do
      let(:instance) { time.call(2026, 6, 30, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "上期ではない（翌期期首）" do
      let(:instance) { time.call(2026, 7, 1, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end
  end

  #
  # 下期
  #

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

  describe "#beginning_of_second_half?" do
    subject { instance.beginning_of_second_half? }

    context "期首" do
      let(:instance) { time.call(2026, 7, 1, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "期首以外" do
      let(:instance) { time.call(2026, 7, 2, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#end_of_second_half?" do
    subject { instance.end_of_second_half? }

    context "期末" do
      let(:instance) { time.call(2026, 12, 31, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "期末以外" do
      let(:instance) { time.call(2027, 1, 1, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end
  end

  describe "#in_second_half?" do
    subject { instance.in_second_half? }

    context "上期ではない（前期期末）" do
      let(:instance) { time.call(2026, 6, 30, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end

    context "上期期首" do
      let(:instance) { time.call(2026, 7, 1, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "上期中" do
      let(:instance) { time.call(2026, 8, 15, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "上期末" do
      let(:instance) { time.call(2026, 12, 31, 12, 34, 56) }

      it { is_expected.to be_truthy }
    end

    context "上期ではない（翌期期首）" do
      let(:instance) { time.call(2027, 1, 1, 12, 34, 56) }

      it { is_expected.to be_falsey }
    end
  end

  # ###################################################################################################################
  # 今四半期関係
  # ###################################################################################################################

  describe "#this_quarter_number" do
    context "1月始まりの場合（初期値）" do
      it { expect(time.call(2026,  1, 15, 12, 34, 56).this_quarter_number).to eq 1 }
      it { expect(time.call(2026,  2, 15, 12, 34, 56).this_quarter_number).to eq 1 }
      it { expect(time.call(2026,  3, 15, 12, 34, 56).this_quarter_number).to eq 1 }
      it { expect(time.call(2026,  4, 15, 12, 34, 56).this_quarter_number).to eq 2 }
      it { expect(time.call(2026,  5, 15, 12, 34, 56).this_quarter_number).to eq 2 }
      it { expect(time.call(2026,  6, 15, 12, 34, 56).this_quarter_number).to eq 2 }
      it { expect(time.call(2026,  7, 15, 12, 34, 56).this_quarter_number).to eq 3 }
      it { expect(time.call(2026,  8, 15, 12, 34, 56).this_quarter_number).to eq 3 }
      it { expect(time.call(2026,  9, 15, 12, 34, 56).this_quarter_number).to eq 3 }
      it { expect(time.call(2026, 10, 15, 12, 34, 56).this_quarter_number).to eq 4 }
      it { expect(time.call(2026, 11, 15, 12, 34, 56).this_quarter_number).to eq 4 }
      it { expect(time.call(2026, 12, 15, 12, 34, 56).this_quarter_number).to eq 4 }
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :april
        end
      end

      it { expect(time.call(2026,  1, 15, 12, 34, 56).this_quarter_number).to eq 4 }
      it { expect(time.call(2026,  2, 15, 12, 34, 56).this_quarter_number).to eq 4 }
      it { expect(time.call(2026,  3, 15, 12, 34, 56).this_quarter_number).to eq 4 }
      it { expect(time.call(2026,  4, 15, 12, 34, 56).this_quarter_number).to eq 1 }
      it { expect(time.call(2026,  5, 15, 12, 34, 56).this_quarter_number).to eq 1 }
      it { expect(time.call(2026,  6, 15, 12, 34, 56).this_quarter_number).to eq 1 }
      it { expect(time.call(2026,  7, 15, 12, 34, 56).this_quarter_number).to eq 2 }
      it { expect(time.call(2026,  8, 15, 12, 34, 56).this_quarter_number).to eq 2 }
      it { expect(time.call(2026,  9, 15, 12, 34, 56).this_quarter_number).to eq 2 }
      it { expect(time.call(2026, 10, 15, 12, 34, 56).this_quarter_number).to eq 3 }
      it { expect(time.call(2026, 11, 15, 12, 34, 56).this_quarter_number).to eq 3 }
      it { expect(time.call(2026, 12, 15, 12, 34, 56).this_quarter_number).to eq 3 }
    end

    context "10月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :october
        end
      end

      it { expect(time.call(2026,  1, 15, 12, 34, 56).this_quarter_number).to eq 2 }
      it { expect(time.call(2026,  2, 15, 12, 34, 56).this_quarter_number).to eq 2 }
      it { expect(time.call(2026,  3, 15, 12, 34, 56).this_quarter_number).to eq 2 }
      it { expect(time.call(2026,  4, 15, 12, 34, 56).this_quarter_number).to eq 3 }
      it { expect(time.call(2026,  5, 15, 12, 34, 56).this_quarter_number).to eq 3 }
      it { expect(time.call(2026,  6, 15, 12, 34, 56).this_quarter_number).to eq 3 }
      it { expect(time.call(2026,  7, 15, 12, 34, 56).this_quarter_number).to eq 4 }
      it { expect(time.call(2026,  8, 15, 12, 34, 56).this_quarter_number).to eq 4 }
      it { expect(time.call(2026,  9, 15, 12, 34, 56).this_quarter_number).to eq 4 }
      it { expect(time.call(2026, 10, 15, 12, 34, 56).this_quarter_number).to eq 1 }
      it { expect(time.call(2026, 11, 15, 12, 34, 56).this_quarter_number).to eq 1 }
      it { expect(time.call(2026, 12, 15, 12, 34, 56).this_quarter_number).to eq 1 }
    end
  end

  describe "#beginning_of_this_quarter" do
    context "1月始まりの場合（初期値）" do
      it do
        expect(time.call(2026,  1, 15, 12, 34, 56).beginning_of_this_quarter)
          .to eq day_beginning.call(2026,  1,  1)
      end

      it do
        expect(time.call(2026,  3, 15, 12, 34, 56).beginning_of_this_quarter)
          .to eq day_beginning.call(2026,  1,  1)
      end

      it do
        expect(time.call(2026,  4, 15, 12, 34, 56).beginning_of_this_quarter)
          .to eq day_beginning.call(2026,  4,  1)
      end

      it do
        expect(time.call(2026,  6, 15, 12, 34, 56).beginning_of_this_quarter)
          .to eq day_beginning.call(2026,  4,  1)
      end

      it do
        expect(time.call(2026,  7, 15, 12, 34, 56).beginning_of_this_quarter)
          .to eq day_beginning.call(2026,  7,  1)
      end

      it do
        expect(time.call(2026,  9, 15, 12, 34, 56).beginning_of_this_quarter)
          .to eq day_beginning.call(2026,  7,  1)
      end

      it do
        expect(time.call(2026, 10, 15, 12, 34, 56).beginning_of_this_quarter)
          .to eq day_beginning.call(2026, 10,  1)
      end

      it do
        expect(time.call(2026, 12, 15, 12, 34, 56).beginning_of_this_quarter)
          .to eq day_beginning.call(2026, 10,  1)
      end
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :april
        end
      end

      it do
        expect(time.call(2026,  1, 15, 12, 34, 56).beginning_of_this_quarter)
          .to eq day_beginning.call(2026,  1,  1)
      end

      it do
        expect(time.call(2026,  3, 15, 12, 34, 56).beginning_of_this_quarter)
          .to eq day_beginning.call(2026,  1,  1)
      end

      it do
        expect(time.call(2026,  4, 15, 12, 34, 56).beginning_of_this_quarter)
          .to eq day_beginning.call(2026,  4,  1)
      end

      it do
        expect(time.call(2026,  6, 15, 12, 34, 56).beginning_of_this_quarter)
          .to eq day_beginning.call(2026,  4,  1)
      end

      it do
        expect(time.call(2026,  7, 15, 12, 34, 56).beginning_of_this_quarter)
          .to eq day_beginning.call(2026,  7,  1)
      end

      it do
        expect(time.call(2026,  9, 15, 12, 34, 56).beginning_of_this_quarter)
          .to eq day_beginning.call(2026,  7,  1)
      end

      it do
        expect(time.call(2026, 10, 15, 12, 34, 56).beginning_of_this_quarter)
          .to eq day_beginning.call(2026, 10,  1)
      end

      it do
        expect(time.call(2026, 12, 15, 12, 34, 56).beginning_of_this_quarter)
          .to eq day_beginning.call(2026, 10,  1)
      end
    end
  end

  describe "#end_of_this_quarter" do
    context "1月始まりの場合（初期値）" do
      it { expect(time.call(2026,  1, 15, 12, 34, 56).end_of_this_quarter).to eq day_end.call(2026,  3, 31) }
      it { expect(time.call(2026,  3, 15, 12, 34, 56).end_of_this_quarter).to eq day_end.call(2026,  3, 31) }
      it { expect(time.call(2026,  4, 15, 12, 34, 56).end_of_this_quarter).to eq day_end.call(2026,  6, 30) }
      it { expect(time.call(2026,  6, 15, 12, 34, 56).end_of_this_quarter).to eq day_end.call(2026,  6, 30) }
      it { expect(time.call(2026,  7, 15, 12, 34, 56).end_of_this_quarter).to eq day_end.call(2026,  9, 30) }
      it { expect(time.call(2026,  9, 15, 12, 34, 56).end_of_this_quarter).to eq day_end.call(2026,  9, 30) }
      it { expect(time.call(2026, 10, 15, 12, 34, 56).end_of_this_quarter).to eq day_end.call(2026, 12, 31) }
      it { expect(time.call(2026, 12, 15, 12, 34, 56).end_of_this_quarter).to eq day_end.call(2026, 12, 31) }
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :april
        end
      end

      it { expect(time.call(2026,  1, 15, 12, 34, 56).end_of_this_quarter).to eq day_end.call(2026,  3, 31) }
      it { expect(time.call(2026,  3, 15, 12, 34, 56).end_of_this_quarter).to eq day_end.call(2026,  3, 31) }
      it { expect(time.call(2026,  4, 15, 12, 34, 56).end_of_this_quarter).to eq day_end.call(2026,  6, 30) }
      it { expect(time.call(2026,  6, 15, 12, 34, 56).end_of_this_quarter).to eq day_end.call(2026,  6, 30) }
      it { expect(time.call(2026,  7, 15, 12, 34, 56).end_of_this_quarter).to eq day_end.call(2026,  9, 30) }
      it { expect(time.call(2026,  9, 15, 12, 34, 56).end_of_this_quarter).to eq day_end.call(2026,  9, 30) }
      it { expect(time.call(2026, 10, 15, 12, 34, 56).end_of_this_quarter).to eq day_end.call(2026, 12, 31) }
      it { expect(time.call(2026, 12, 15, 12, 34, 56).end_of_this_quarter).to eq day_end.call(2026, 12, 31) }
    end
  end

  describe "#all_this_quarter" do
    context "1月始まりの場合（初期値）" do
      it do
        expect(time.call(2026,  1, 15, 12, 34, 56).all_this_quarter)
          .to eq ::Range.new(day_beginning.call(2026,  1,  1), day_end.call(2026,  3, 31))
      end

      it do
        expect(time.call(2026,  3, 15, 12, 34, 56).all_this_quarter)
          .to eq ::Range.new(day_beginning.call(2026,  1,  1), day_end.call(2026,  3, 31))
      end

      it do
        expect(time.call(2026,  4, 15, 12, 34, 56).all_this_quarter)
          .to eq ::Range.new(day_beginning.call(2026,  4,  1), day_end.call(2026,  6, 30))
      end

      it do
        expect(time.call(2026,  6, 15, 12, 34, 56).all_this_quarter)
          .to eq ::Range.new(day_beginning.call(2026,  4,  1), day_end.call(2026,  6, 30))
      end

      it do
        expect(time.call(2026,  7, 15, 12, 34, 56).all_this_quarter)
          .to eq ::Range.new(day_beginning.call(2026,  7,  1), day_end.call(2026,  9, 30))
      end

      it do
        expect(time.call(2026,  9, 15, 12, 34, 56).all_this_quarter)
          .to eq ::Range.new(day_beginning.call(2026,  7,  1), day_end.call(2026,  9, 30))
      end

      it do
        expect(time.call(2026, 10, 15, 12, 34, 56).all_this_quarter)
          .to eq ::Range.new(day_beginning.call(2026, 10,  1), day_end.call(2026, 12, 31))
      end

      it do
        expect(time.call(2026, 12, 15, 12, 34, 56).all_this_quarter)
          .to eq ::Range.new(day_beginning.call(2026, 10,  1), day_end.call(2026, 12, 31))
      end
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :april
        end
      end

      it do
        expect(time.call(2026,  1, 15, 12, 34, 56).all_this_quarter)
          .to eq ::Range.new(day_beginning.call(2026,  1,  1), day_end.call(2026,  3, 31))
      end

      it do
        expect(time.call(2026,  3, 15, 12, 34, 56).all_this_quarter)
          .to eq ::Range.new(day_beginning.call(2026,  1,  1), day_end.call(2026,  3, 31))
      end

      it do
        expect(time.call(2026,  4, 15, 12, 34, 56).all_this_quarter)
          .to eq ::Range.new(day_beginning.call(2026,  4,  1), day_end.call(2026,  6, 30))
      end

      it do
        expect(time.call(2026,  6, 15, 12, 34, 56).all_this_quarter)
          .to eq ::Range.new(day_beginning.call(2026,  4,  1), day_end.call(2026,  6, 30))
      end

      it do
        expect(time.call(2026,  7, 15, 12, 34, 56).all_this_quarter)
          .to eq ::Range.new(day_beginning.call(2026,  7,  1), day_end.call(2026,  9, 30))
      end

      it do
        expect(time.call(2026,  9, 15, 12, 34, 56).all_this_quarter)
          .to eq ::Range.new(day_beginning.call(2026,  7,  1), day_end.call(2026,  9, 30))
      end

      it do
        expect(time.call(2026, 10, 15, 12, 34, 56).all_this_quarter)
          .to eq ::Range.new(day_beginning.call(2026, 10,  1), day_end.call(2026, 12, 31))
      end

      it do
        expect(time.call(2026, 12, 15, 12, 34, 56).all_this_quarter)
          .to eq ::Range.new(day_beginning.call(2026, 10,  1), day_end.call(2026, 12, 31))
      end
    end
  end

  describe "#beginning_of_next_quarter" do
    context "1月始まりの場合（初期値）" do
      it do
        expect(time.call(2026,  1, 15, 12, 34, 56).beginning_of_next_quarter)
          .to eq day_beginning.call(2026,  4,  1)
      end

      it do
        expect(time.call(2026,  3, 15, 12, 34, 56).beginning_of_next_quarter)
          .to eq day_beginning.call(2026,  4,  1)
      end

      it do
        expect(time.call(2026,  4, 15, 12, 34, 56).beginning_of_next_quarter)
          .to eq day_beginning.call(2026,  7,  1)
      end

      it do
        expect(time.call(2026,  6, 15, 12, 34, 56).beginning_of_next_quarter)
          .to eq day_beginning.call(2026,  7,  1)
      end

      it do
        expect(time.call(2026,  7, 15, 12, 34, 56).beginning_of_next_quarter)
          .to eq day_beginning.call(2026, 10,  1)
      end

      it do
        expect(time.call(2026,  9, 15, 12, 34, 56).beginning_of_next_quarter)
          .to eq day_beginning.call(2026, 10,  1)
      end

      it do
        expect(time.call(2026, 10, 15, 12, 34, 56).beginning_of_next_quarter)
          .to eq day_beginning.call(2027,  1,  1)
      end

      it do
        expect(time.call(2026, 12, 15, 12, 34, 56).beginning_of_next_quarter)
          .to eq day_beginning.call(2027,  1,  1)
      end
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :april
        end
      end

      it do
        expect(time.call(2026,  1, 15, 12, 34, 56).beginning_of_next_quarter)
          .to eq day_beginning.call(2026,  4,  1)
      end

      it do
        expect(time.call(2026,  3, 15, 12, 34, 56).beginning_of_next_quarter)
          .to eq day_beginning.call(2026,  4,  1)
      end

      it do
        expect(time.call(2026,  4, 15, 12, 34, 56).beginning_of_next_quarter)
          .to eq day_beginning.call(2026,  7,  1)
      end

      it do
        expect(time.call(2026,  6, 15, 12, 34, 56).beginning_of_next_quarter)
          .to eq day_beginning.call(2026,  7,  1)
      end

      it do
        expect(time.call(2026,  7, 15, 12, 34, 56).beginning_of_next_quarter)
          .to eq day_beginning.call(2026, 10,  1)
      end

      it do
        expect(time.call(2026,  9, 15, 12, 34, 56).beginning_of_next_quarter)
          .to eq day_beginning.call(2026, 10,  1)
      end

      it do
        expect(time.call(2026, 10, 15, 12, 34, 56).beginning_of_next_quarter)
          .to eq day_beginning.call(2027,  1,  1)
      end

      it do
        expect(time.call(2026, 12, 15, 12, 34, 56).beginning_of_next_quarter)
          .to eq day_beginning.call(2027,  1,  1)
      end
    end
  end

  describe "#end_of_next_quarter" do
    context "1月始まりの場合（初期値）" do
      it do
        expect(time.call(2026,  1, 15, 12, 34, 56).end_of_next_quarter)
          .to eq day_end.call(2026,  6, 30)
      end

      it do
        expect(time.call(2026,  3, 15, 12, 34, 56).end_of_next_quarter)
          .to eq day_end.call(2026,  6, 30)
      end

      it do
        expect(time.call(2026,  4, 15, 12, 34, 56).end_of_next_quarter)
          .to eq day_end.call(2026,  9, 30)
      end

      it do
        expect(time.call(2026,  6, 15, 12, 34, 56).end_of_next_quarter)
          .to eq day_end.call(2026,  9, 30)
      end

      it do
        expect(time.call(2026,  7, 15, 12, 34, 56).end_of_next_quarter)
          .to eq day_end.call(2026, 12, 31)
      end

      it do
        expect(time.call(2026,  9, 15, 12, 34, 56).end_of_next_quarter)
          .to eq day_end.call(2026, 12, 31)
      end

      it do
        expect(time.call(2026, 10, 15, 12, 34, 56).end_of_next_quarter)
          .to eq day_end.call(2027,  3, 31)
      end

      it do
        expect(time.call(2026, 12, 15, 12, 34, 56).end_of_next_quarter)
          .to eq day_end.call(2027,  3, 31)
      end
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :april
        end
      end

      it do
        expect(time.call(2026,  1, 15, 12, 34, 56).end_of_next_quarter)
          .to eq day_end.call(2026,  6, 30)
      end

      it do
        expect(time.call(2026,  3, 15, 12, 34, 56).end_of_next_quarter)
          .to eq day_end.call(2026,  6, 30)
      end

      it do
        expect(time.call(2026,  4, 15, 12, 34, 56).end_of_next_quarter)
          .to eq day_end.call(2026,  9, 30)
      end

      it do
        expect(time.call(2026,  6, 15, 12, 34, 56).end_of_next_quarter)
          .to eq day_end.call(2026,  9, 30)
      end

      it do
        expect(time.call(2026,  7, 15, 12, 34, 56).end_of_next_quarter)
          .to eq day_end.call(2026, 12, 31)
      end

      it do
        expect(time.call(2026,  9, 15, 12, 34, 56).end_of_next_quarter)
          .to eq day_end.call(2026, 12, 31)
      end

      it do
        expect(time.call(2026, 10, 15, 12, 34, 56).end_of_next_quarter)
          .to eq day_end.call(2027,  3, 31)
      end

      it do
        expect(time.call(2026, 12, 15, 12, 34, 56).end_of_next_quarter)
          .to eq day_end.call(2027,  3, 31)
      end
    end
  end

  describe "#all_next_quarter" do
    context "1月始まりの場合（初期値）" do
      it do
        expect(time.call(2026,  1, 15, 12, 34, 56).all_next_quarter)
          .to eq ::Range.new(day_beginning.call(2026,  4,  1), day_end.call(2026,  6, 30))
      end

      it do
        expect(time.call(2026,  3, 15, 12, 34, 56).all_next_quarter)
          .to eq ::Range.new(day_beginning.call(2026,  4,  1), day_end.call(2026,  6, 30))
      end

      it do
        expect(time.call(2026,  4, 15, 12, 34, 56).all_next_quarter)
          .to eq ::Range.new(day_beginning.call(2026,  7,  1), day_end.call(2026,  9, 30))
      end

      it do
        expect(time.call(2026,  6, 15, 12, 34, 56).all_next_quarter)
          .to eq ::Range.new(day_beginning.call(2026,  7,  1), day_end.call(2026,  9, 30))
      end

      it do
        expect(time.call(2026,  7, 15, 12, 34, 56).all_next_quarter)
          .to eq ::Range.new(day_beginning.call(2026, 10,  1), day_end.call(2026, 12, 31))
      end

      it do
        expect(time.call(2026,  9, 15, 12, 34, 56).all_next_quarter)
          .to eq ::Range.new(day_beginning.call(2026, 10,  1), day_end.call(2026, 12, 31))
      end

      it do
        expect(time.call(2026, 10, 15, 12, 34, 56).all_next_quarter)
          .to eq ::Range.new(day_beginning.call(2027,  1,  1), day_end.call(2027,  3, 31))
      end

      it do
        expect(time.call(2026, 12, 15, 12, 34, 56).all_next_quarter)
          .to eq ::Range.new(day_beginning.call(2027,  1,  1), day_end.call(2027,  3, 31))
      end
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :april
        end
      end

      it do
        expect(time.call(2026,  1, 15, 12, 34, 56).all_next_quarter)
          .to eq ::Range.new(day_beginning.call(2026,  4,  1), day_end.call(2026,  6, 30))
      end

      it do
        expect(time.call(2026,  3, 15, 12, 34, 56).all_next_quarter)
          .to eq ::Range.new(day_beginning.call(2026,  4,  1), day_end.call(2026,  6, 30))
      end

      it do
        expect(time.call(2026,  4, 15, 12, 34, 56).all_next_quarter)
          .to eq ::Range.new(day_beginning.call(2026,  7,  1), day_end.call(2026,  9, 30))
      end

      it do
        expect(time.call(2026,  6, 15, 12, 34, 56).all_next_quarter)
          .to eq ::Range.new(day_beginning.call(2026,  7,  1), day_end.call(2026,  9, 30))
      end

      it do
        expect(time.call(2026,  7, 15, 12, 34, 56).all_next_quarter)
          .to eq ::Range.new(day_beginning.call(2026, 10,  1), day_end.call(2026, 12, 31))
      end

      it do
        expect(time.call(2026,  9, 15, 12, 34, 56).all_next_quarter)
          .to eq ::Range.new(day_beginning.call(2026, 10,  1), day_end.call(2026, 12, 31))
      end

      it do
        expect(time.call(2026, 10, 15, 12, 34, 56).all_next_quarter)
          .to eq ::Range.new(day_beginning.call(2027,  1,  1), day_end.call(2027,  3, 31))
      end

      it do
        expect(time.call(2026, 12, 15, 12, 34, 56).all_next_quarter)
          .to eq ::Range.new(day_beginning.call(2027,  1,  1), day_end.call(2027,  3, 31))
      end
    end
  end

  describe "#beginning_of_prev_quarter" do
    context "1月始まりの場合（初期値）" do
      it do
        expect(time.call(2026,  1, 15, 12, 34, 56).beginning_of_prev_quarter)
          .to eq day_beginning.call(2025, 10,  1)
      end

      it do
        expect(time.call(2026,  3, 15, 12, 34, 56).beginning_of_prev_quarter)
          .to eq day_beginning.call(2025, 10,  1)
      end

      it do
        expect(time.call(2026,  4, 15, 12, 34, 56).beginning_of_prev_quarter)
          .to eq day_beginning.call(2026,  1,  1)
      end

      it do
        expect(time.call(2026,  6, 15, 12, 34, 56).beginning_of_prev_quarter)
          .to eq day_beginning.call(2026,  1,  1)
      end

      it do
        expect(time.call(2026,  7, 15, 12, 34, 56).beginning_of_prev_quarter)
          .to eq day_beginning.call(2026,  4,  1)
      end

      it do
        expect(time.call(2026,  9, 15, 12, 34, 56).beginning_of_prev_quarter)
          .to eq day_beginning.call(2026,  4,  1)
      end

      it do
        expect(time.call(2026, 10, 15, 12, 34, 56).beginning_of_prev_quarter)
          .to eq day_beginning.call(2026,  7,  1)
      end

      it do
        expect(time.call(2026, 12, 15, 12, 34, 56).beginning_of_prev_quarter)
          .to eq day_beginning.call(2026,  7,  1)
      end
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :april
        end
      end

      it do
        expect(time.call(2026,  1, 15, 12, 34, 56).beginning_of_prev_quarter)
          .to eq day_beginning.call(2025, 10,  1)
      end

      it do
        expect(time.call(2026,  3, 15, 12, 34, 56).beginning_of_prev_quarter)
          .to eq day_beginning.call(2025, 10,  1)
      end

      it do
        expect(time.call(2026,  4, 15, 12, 34, 56).beginning_of_prev_quarter)
          .to eq day_beginning.call(2026,  1,  1)
      end

      it do
        expect(time.call(2026,  6, 15, 12, 34, 56).beginning_of_prev_quarter)
          .to eq day_beginning.call(2026,  1,  1)
      end

      it do
        expect(time.call(2026,  7, 15, 12, 34, 56).beginning_of_prev_quarter)
          .to eq day_beginning.call(2026,  4,  1)
      end

      it do
        expect(time.call(2026,  9, 15, 12, 34, 56).beginning_of_prev_quarter)
          .to eq day_beginning.call(2026,  4,  1)
      end

      it do
        expect(time.call(2026, 10, 15, 12, 34, 56).beginning_of_prev_quarter)
          .to eq day_beginning.call(2026,  7,  1)
      end

      it do
        expect(time.call(2026, 12, 15, 12, 34, 56).beginning_of_prev_quarter)
          .to eq day_beginning.call(2026,  7,  1)
      end
    end
  end

  describe "#end_of_prev_quarter" do
    context "1月始まりの場合（初期値）" do
      it do
        expect(time.call(2026,  1, 15, 12, 34, 56).end_of_prev_quarter)
          .to eq day_end.call(2025, 12, 31)
      end

      it do
        expect(time.call(2026,  3, 15, 12, 34, 56).end_of_prev_quarter)
          .to eq day_end.call(2025, 12, 31)
      end

      it do
        expect(time.call(2026,  4, 15, 12, 34, 56).end_of_prev_quarter)
          .to eq day_end.call(2026,  3, 31)
      end

      it do
        expect(time.call(2026,  6, 15, 12, 34, 56).end_of_prev_quarter)
          .to eq day_end.call(2026,  3, 31)
      end

      it do
        expect(time.call(2026,  7, 15, 12, 34, 56).end_of_prev_quarter)
          .to eq day_end.call(2026,  6, 30)
      end

      it do
        expect(time.call(2026,  9, 15, 12, 34, 56).end_of_prev_quarter)
          .to eq day_end.call(2026,  6, 30)
      end

      it do
        expect(time.call(2026, 10, 15, 12, 34, 56).end_of_prev_quarter)
          .to eq day_end.call(2026,  9, 30)
      end

      it do
        expect(time.call(2026, 12, 15, 12, 34, 56).end_of_prev_quarter)
          .to eq day_end.call(2026,  9, 30)
      end
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :april
        end
      end

      it do
        expect(time.call(2026,  1, 15, 12, 34, 56).end_of_prev_quarter)
          .to eq day_end.call(2025, 12, 31)
      end

      it do
        expect(time.call(2026,  3, 15, 12, 34, 56).end_of_prev_quarter)
          .to eq day_end.call(2025, 12, 31)
      end

      it do
        expect(time.call(2026,  4, 15, 12, 34, 56).end_of_prev_quarter)
          .to eq day_end.call(2026,  3, 31)
      end

      it do
        expect(time.call(2026,  6, 15, 12, 34, 56).end_of_prev_quarter)
          .to eq day_end.call(2026,  3, 31)
      end

      it do
        expect(time.call(2026,  7, 15, 12, 34, 56).end_of_prev_quarter)
          .to eq day_end.call(2026,  6, 30)
      end

      it do
        expect(time.call(2026,  9, 15, 12, 34, 56).end_of_prev_quarter)
          .to eq day_end.call(2026,  6, 30)
      end

      it do
        expect(time.call(2026, 10, 15, 12, 34, 56).end_of_prev_quarter)
          .to eq day_end.call(2026,  9, 30)
      end

      it do
        expect(time.call(2026, 12, 15, 12, 34, 56).end_of_prev_quarter)
          .to eq day_end.call(2026,  9, 30)
      end
    end
  end

  describe "#all_prev_quarter" do
    context "1月始まりの場合（初期値）" do
      it do
        expect(time.call(2026,  1, 15, 12, 34, 56).all_prev_quarter)
          .to eq ::Range.new(day_beginning.call(2025, 10,  1), day_end.call(2025, 12, 31))
      end

      it do
        expect(time.call(2026,  3, 15, 12, 34, 56).all_prev_quarter)
          .to eq ::Range.new(day_beginning.call(2025, 10,  1), day_end.call(2025, 12, 31))
      end

      it do
        expect(time.call(2026,  4, 15, 12, 34, 56).all_prev_quarter)
          .to eq ::Range.new(day_beginning.call(2026,  1,  1), day_end.call(2026,  3, 31))
      end

      it do
        expect(time.call(2026,  6, 15, 12, 34, 56).all_prev_quarter)
          .to eq ::Range.new(day_beginning.call(2026,  1,  1), day_end.call(2026,  3, 31))
      end

      it do
        expect(time.call(2026,  7, 15, 12, 34, 56).all_prev_quarter)
          .to eq ::Range.new(day_beginning.call(2026,  4,  1), day_end.call(2026,  6, 30))
      end

      it do
        expect(time.call(2026,  9, 15, 12, 34, 56).all_prev_quarter)
          .to eq ::Range.new(day_beginning.call(2026,  4,  1), day_end.call(2026,  6, 30))
      end

      it do
        expect(time.call(2026, 10, 15, 12, 34, 56).all_prev_quarter)
          .to eq ::Range.new(day_beginning.call(2026,  7,  1), day_end.call(2026,  9, 30))
      end

      it do
        expect(time.call(2026, 12, 15, 12, 34, 56).all_prev_quarter)
          .to eq ::Range.new(day_beginning.call(2026,  7,  1), day_end.call(2026,  9, 30))
      end
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :april
        end
      end

      it do
        expect(time.call(2026,  1, 15, 12, 34, 56).all_prev_quarter)
          .to eq ::Range.new(day_beginning.call(2025, 10,  1), day_end.call(2025, 12, 31))
      end

      it do
        expect(time.call(2026,  3, 15, 12, 34, 56).all_prev_quarter)
          .to eq ::Range.new(day_beginning.call(2025, 10,  1), day_end.call(2025, 12, 31))
      end

      it do
        expect(time.call(2026,  4, 15, 12, 34, 56).all_prev_quarter)
          .to eq ::Range.new(day_beginning.call(2026,  1,  1), day_end.call(2026,  3, 31))
      end

      it do
        expect(time.call(2026,  6, 15, 12, 34, 56).all_prev_quarter)
          .to eq ::Range.new(day_beginning.call(2026,  1,  1), day_end.call(2026,  3, 31))
      end

      it do
        expect(time.call(2026,  7, 15, 12, 34, 56).all_prev_quarter)
          .to eq ::Range.new(day_beginning.call(2026,  4,  1), day_end.call(2026,  6, 30))
      end

      it do
        expect(time.call(2026,  9, 15, 12, 34, 56).all_prev_quarter)
          .to eq ::Range.new(day_beginning.call(2026,  4,  1), day_end.call(2026,  6, 30))
      end

      it do
        expect(time.call(2026, 10, 15, 12, 34, 56).all_prev_quarter)
          .to eq ::Range.new(day_beginning.call(2026,  7,  1), day_end.call(2026,  9, 30))
      end

      it do
        expect(time.call(2026, 12, 15, 12, 34, 56).all_prev_quarter)
          .to eq ::Range.new(day_beginning.call(2026,  7,  1), day_end.call(2026,  9, 30))
      end
    end
  end

  # ###################################################################################################################
  # 今期関係
  # ###################################################################################################################

  describe "#this_half_number" do
    context "1月始まりの場合（初期値）" do
      it { expect(time.call(2026,  1, 15, 12, 34, 56).this_half_number).to eq 1 }
      it { expect(time.call(2026,  2, 15, 12, 34, 56).this_half_number).to eq 1 }
      it { expect(time.call(2026,  3, 15, 12, 34, 56).this_half_number).to eq 1 }
      it { expect(time.call(2026,  4, 15, 12, 34, 56).this_half_number).to eq 1 }
      it { expect(time.call(2026,  5, 15, 12, 34, 56).this_half_number).to eq 1 }
      it { expect(time.call(2026,  6, 15, 12, 34, 56).this_half_number).to eq 1 }
      it { expect(time.call(2026,  7, 15, 12, 34, 56).this_half_number).to eq 2 }
      it { expect(time.call(2026,  8, 15, 12, 34, 56).this_half_number).to eq 2 }
      it { expect(time.call(2026,  9, 15, 12, 34, 56).this_half_number).to eq 2 }
      it { expect(time.call(2026, 10, 15, 12, 34, 56).this_half_number).to eq 2 }
      it { expect(time.call(2026, 11, 15, 12, 34, 56).this_half_number).to eq 2 }
      it { expect(time.call(2026, 12, 15, 12, 34, 56).this_half_number).to eq 2 }
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :april
        end
      end

      it { expect(time.call(2026,  1, 15, 12, 34, 56).this_half_number).to eq 2 }
      it { expect(time.call(2026,  2, 15, 12, 34, 56).this_half_number).to eq 2 }
      it { expect(time.call(2026,  3, 15, 12, 34, 56).this_half_number).to eq 2 }
      it { expect(time.call(2026,  4, 15, 12, 34, 56).this_half_number).to eq 1 }
      it { expect(time.call(2026,  5, 15, 12, 34, 56).this_half_number).to eq 1 }
      it { expect(time.call(2026,  6, 15, 12, 34, 56).this_half_number).to eq 1 }
      it { expect(time.call(2026,  7, 15, 12, 34, 56).this_half_number).to eq 1 }
      it { expect(time.call(2026,  8, 15, 12, 34, 56).this_half_number).to eq 1 }
      it { expect(time.call(2026,  9, 15, 12, 34, 56).this_half_number).to eq 1 }
      it { expect(time.call(2026, 10, 15, 12, 34, 56).this_half_number).to eq 2 }
      it { expect(time.call(2026, 11, 15, 12, 34, 56).this_half_number).to eq 2 }
      it { expect(time.call(2026, 12, 15, 12, 34, 56).this_half_number).to eq 2 }
    end

    context "10月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :october
        end
      end

      it { expect(time.call(2026,  1, 15, 12, 34, 56).this_half_number).to eq 1 }
      it { expect(time.call(2026,  2, 15, 12, 34, 56).this_half_number).to eq 1 }
      it { expect(time.call(2026,  3, 15, 12, 34, 56).this_half_number).to eq 1 }
      it { expect(time.call(2026,  4, 15, 12, 34, 56).this_half_number).to eq 2 }
      it { expect(time.call(2026,  5, 15, 12, 34, 56).this_half_number).to eq 2 }
      it { expect(time.call(2026,  6, 15, 12, 34, 56).this_half_number).to eq 2 }
      it { expect(time.call(2026,  7, 15, 12, 34, 56).this_half_number).to eq 2 }
      it { expect(time.call(2026,  8, 15, 12, 34, 56).this_half_number).to eq 2 }
      it { expect(time.call(2026,  9, 15, 12, 34, 56).this_half_number).to eq 2 }
      it { expect(time.call(2026, 10, 15, 12, 34, 56).this_half_number).to eq 1 }
      it { expect(time.call(2026, 11, 15, 12, 34, 56).this_half_number).to eq 1 }
      it { expect(time.call(2026, 12, 15, 12, 34, 56).this_half_number).to eq 1 }
    end
  end

  describe "#beginning_of_this_half" do
    context "1月始まりの場合（初期値）" do
      it { expect(time.call(2026,  1, 15, 12, 34, 56).beginning_of_this_half).to eq day_beginning.call(2026,  1,  1) }
      it { expect(time.call(2026,  3, 15, 12, 34, 56).beginning_of_this_half).to eq day_beginning.call(2026,  1,  1) }
      it { expect(time.call(2026,  4, 15, 12, 34, 56).beginning_of_this_half).to eq day_beginning.call(2026,  1,  1) }
      it { expect(time.call(2026,  6, 15, 12, 34, 56).beginning_of_this_half).to eq day_beginning.call(2026,  1,  1) }
      it { expect(time.call(2026,  7, 15, 12, 34, 56).beginning_of_this_half).to eq day_beginning.call(2026,  7,  1) }
      it { expect(time.call(2026,  9, 15, 12, 34, 56).beginning_of_this_half).to eq day_beginning.call(2026,  7,  1) }
      it { expect(time.call(2026, 10, 15, 12, 34, 56).beginning_of_this_half).to eq day_beginning.call(2026,  7,  1) }
      it { expect(time.call(2026, 12, 15, 12, 34, 56).beginning_of_this_half).to eq day_beginning.call(2026,  7,  1) }
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :april
        end
      end

      it { expect(time.call(2026,  1, 15, 12, 34, 56).beginning_of_this_half).to eq day_beginning.call(2025, 10,  1) }
      it { expect(time.call(2026,  3, 15, 12, 34, 56).beginning_of_this_half).to eq day_beginning.call(2025, 10,  1) }
      it { expect(time.call(2026,  4, 15, 12, 34, 56).beginning_of_this_half).to eq day_beginning.call(2026,  4,  1) }
      it { expect(time.call(2026,  6, 15, 12, 34, 56).beginning_of_this_half).to eq day_beginning.call(2026,  4,  1) }
      it { expect(time.call(2026,  7, 15, 12, 34, 56).beginning_of_this_half).to eq day_beginning.call(2026,  4,  1) }
      it { expect(time.call(2026,  9, 15, 12, 34, 56).beginning_of_this_half).to eq day_beginning.call(2026,  4,  1) }
      it { expect(time.call(2026, 10, 15, 12, 34, 56).beginning_of_this_half).to eq day_beginning.call(2026, 10,  1) }
      it { expect(time.call(2026, 12, 15, 12, 34, 56).beginning_of_this_half).to eq day_beginning.call(2026, 10,  1) }
    end
  end

  describe "#end_of_this_half" do
    context "1月始まりの場合（初期値）" do
      it { expect(time.call(2026,  1, 15, 12, 34, 56).end_of_this_half).to eq day_end.call(2026,  6, 30) }
      it { expect(time.call(2026,  3, 15, 12, 34, 56).end_of_this_half).to eq day_end.call(2026,  6, 30) }
      it { expect(time.call(2026,  4, 15, 12, 34, 56).end_of_this_half).to eq day_end.call(2026,  6, 30) }
      it { expect(time.call(2026,  6, 15, 12, 34, 56).end_of_this_half).to eq day_end.call(2026,  6, 30) }
      it { expect(time.call(2026,  7, 15, 12, 34, 56).end_of_this_half).to eq day_end.call(2026, 12, 31) }
      it { expect(time.call(2026,  9, 15, 12, 34, 56).end_of_this_half).to eq day_end.call(2026, 12, 31) }
      it { expect(time.call(2026, 10, 15, 12, 34, 56).end_of_this_half).to eq day_end.call(2026, 12, 31) }
      it { expect(time.call(2026, 12, 15, 12, 34, 56).end_of_this_half).to eq day_end.call(2026, 12, 31) }
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :april
        end
      end

      it { expect(time.call(2026,  1, 15, 12, 34, 56).end_of_this_half).to eq day_end.call(2026,  3, 31) }
      it { expect(time.call(2026,  3, 15, 12, 34, 56).end_of_this_half).to eq day_end.call(2026,  3, 31) }
      it { expect(time.call(2026,  4, 15, 12, 34, 56).end_of_this_half).to eq day_end.call(2026,  9, 30) }
      it { expect(time.call(2026,  6, 15, 12, 34, 56).end_of_this_half).to eq day_end.call(2026,  9, 30) }
      it { expect(time.call(2026,  7, 15, 12, 34, 56).end_of_this_half).to eq day_end.call(2026,  9, 30) }
      it { expect(time.call(2026,  9, 15, 12, 34, 56).end_of_this_half).to eq day_end.call(2026,  9, 30) }
      it { expect(time.call(2026, 10, 15, 12, 34, 56).end_of_this_half).to eq day_end.call(2027,  3, 31) }
      it { expect(time.call(2026, 12, 15, 12, 34, 56).end_of_this_half).to eq day_end.call(2027,  3, 31) }
    end
  end

  describe "#all_this_half" do
    context "1月始まりの場合（初期値）" do
      it do
        expect(time.call(2026,  1, 15, 12, 34, 56).all_this_half)
          .to eq ::Range.new(day_beginning.call(2026,  1,  1), day_end.call(2026,  6, 30))
      end

      it do
        expect(time.call(2026,  3, 15, 12, 34, 56).all_this_half)
          .to eq ::Range.new(day_beginning.call(2026,  1,  1), day_end.call(2026,  6, 30))
      end

      it do
        expect(time.call(2026,  4, 15, 12, 34, 56).all_this_half)
          .to eq ::Range.new(day_beginning.call(2026,  1,  1), day_end.call(2026,  6, 30))
      end

      it do
        expect(time.call(2026,  6, 15, 12, 34, 56).all_this_half)
          .to eq ::Range.new(day_beginning.call(2026,  1,  1), day_end.call(2026,  6, 30))
      end

      it do
        expect(time.call(2026,  7, 15, 12, 34, 56).all_this_half)
          .to eq ::Range.new(day_beginning.call(2026,  7,  1), day_end.call(2026, 12, 31))
      end

      it do
        expect(time.call(2026,  9, 15, 12, 34, 56).all_this_half)
          .to eq ::Range.new(day_beginning.call(2026,  7,  1), day_end.call(2026, 12, 31))
      end

      it do
        expect(time.call(2026, 10, 15, 12, 34, 56).all_this_half)
          .to eq ::Range.new(day_beginning.call(2026,  7,  1), day_end.call(2026, 12, 31))
      end

      it do
        expect(time.call(2026, 12, 15, 12, 34, 56).all_this_half)
          .to eq ::Range.new(day_beginning.call(2026,  7,  1), day_end.call(2026, 12, 31))
      end
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :april
        end
      end

      it do
        expect(time.call(2026,  1, 15, 12, 34, 56).all_this_half)
          .to eq ::Range.new(day_beginning.call(2025, 10,  1), day_end.call(2026,  3, 31))
      end

      it do
        expect(time.call(2026,  3, 15, 12, 34, 56).all_this_half)
          .to eq ::Range.new(day_beginning.call(2025, 10,  1), day_end.call(2026,  3, 31))
      end

      it do
        expect(time.call(2026,  4, 15, 12, 34, 56).all_this_half)
          .to eq ::Range.new(day_beginning.call(2026,  4,  1), day_end.call(2026,  9, 30))
      end

      it do
        expect(time.call(2026,  6, 15, 12, 34, 56).all_this_half)
          .to eq ::Range.new(day_beginning.call(2026,  4,  1), day_end.call(2026,  9, 30))
      end

      it do
        expect(time.call(2026,  7, 15, 12, 34, 56).all_this_half)
          .to eq ::Range.new(day_beginning.call(2026,  4,  1), day_end.call(2026,  9, 30))
      end

      it do
        expect(time.call(2026,  9, 15, 12, 34, 56).all_this_half)
          .to eq ::Range.new(day_beginning.call(2026,  4,  1), day_end.call(2026,  9, 30))
      end

      it do
        expect(time.call(2026, 10, 15, 12, 34, 56).all_this_half)
          .to eq ::Range.new(day_beginning.call(2026, 10,  1), day_end.call(2027,  3, 31))
      end

      it do
        expect(time.call(2026, 12, 15, 12, 34, 56).all_this_half)
          .to eq ::Range.new(day_beginning.call(2026, 10,  1), day_end.call(2027,  3, 31))
      end
    end
  end

  describe "#beginning_of_next_half" do
    context "1月始まりの場合（初期値）" do
      it do
        expect(time.call(2026,  1, 15, 12, 34, 56).beginning_of_next_half)
          .to eq day_beginning.call(2026,  7,  1)
      end

      it do
        expect(time.call(2026,  3, 15, 12, 34, 56).beginning_of_next_half)
          .to eq day_beginning.call(2026,  7,  1)
      end

      it do
        expect(time.call(2026,  4, 15, 12, 34, 56).beginning_of_next_half)
          .to eq day_beginning.call(2026,  7,  1)
      end

      it do
        expect(time.call(2026,  6, 15, 12, 34, 56).beginning_of_next_half)
          .to eq day_beginning.call(2026,  7,  1)
      end

      it do
        expect(time.call(2026,  7, 15, 12, 34, 56).beginning_of_next_half)
          .to eq day_beginning.call(2027,  1,  1)
      end

      it do
        expect(time.call(2026,  9, 15, 12, 34, 56).beginning_of_next_half)
          .to eq day_beginning.call(2027,  1,  1)
      end

      it do
        expect(time.call(2026, 10, 15, 12, 34, 56).beginning_of_next_half)
          .to eq day_beginning.call(2027,  1,  1)
      end

      it do
        expect(time.call(2026, 12, 15, 12, 34, 56).beginning_of_next_half)
          .to eq day_beginning.call(2027,  1,  1)
      end
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :april
        end
      end

      it do
        expect(time.call(2026,  1, 15, 12, 34, 56).beginning_of_next_half)
          .to eq day_beginning.call(2026,  4,  1)
      end

      it do
        expect(time.call(2026,  3, 15, 12, 34, 56).beginning_of_next_half)
          .to eq day_beginning.call(2026,  4,  1)
      end

      it do
        expect(time.call(2026,  4, 15, 12, 34, 56).beginning_of_next_half)
          .to eq day_beginning.call(2026, 10,  1)
      end

      it do
        expect(time.call(2026,  6, 15, 12, 34, 56).beginning_of_next_half)
          .to eq day_beginning.call(2026, 10,  1)
      end

      it do
        expect(time.call(2026,  7, 15, 12, 34, 56).beginning_of_next_half)
          .to eq day_beginning.call(2026, 10,  1)
      end

      it do
        expect(time.call(2026,  9, 15, 12, 34, 56).beginning_of_next_half)
          .to eq day_beginning.call(2026, 10,  1)
      end

      it do
        expect(time.call(2026, 10, 15, 12, 34, 56).beginning_of_next_half)
          .to eq day_beginning.call(2027,  4,  1)
      end

      it do
        expect(time.call(2026, 12, 15, 12, 34, 56).beginning_of_next_half)
          .to eq day_beginning.call(2027,  4,  1)
      end
    end
  end

  describe "#end_of_next_half" do
    context "1月始まりの場合（初期値）" do
      it do
        expect(time.call(2026,  1, 15, 12, 34, 56).end_of_next_half)
          .to eq day_end.call(2026, 12, 31)
      end

      it do
        expect(time.call(2026,  3, 15, 12, 34, 56).end_of_next_half)
          .to eq day_end.call(2026, 12, 31)
      end

      it do
        expect(time.call(2026,  4, 15, 12, 34, 56).end_of_next_half)
          .to eq day_end.call(2026, 12, 31)
      end

      it do
        expect(time.call(2026,  6, 15, 12, 34, 56).end_of_next_half)
          .to eq day_end.call(2026, 12, 31)
      end

      it do
        expect(time.call(2026,  7, 15, 12, 34, 56).end_of_next_half)
          .to eq day_end.call(2027,  6, 30)
      end

      it do
        expect(time.call(2026,  9, 15, 12, 34, 56).end_of_next_half)
          .to eq day_end.call(2027,  6, 30)
      end

      it do
        expect(time.call(2026, 10, 15, 12, 34, 56).end_of_next_half)
          .to eq day_end.call(2027,  6, 30)
      end

      it do
        expect(time.call(2026, 12, 15, 12, 34, 56).end_of_next_half)
          .to eq day_end.call(2027,  6, 30)
      end
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :april
        end
      end

      it do
        expect(time.call(2026,  1, 15, 12, 34, 56).end_of_next_half)
          .to eq day_end.call(2026,  9, 30)
      end

      it do
        expect(time.call(2026,  3, 15, 12, 34, 56).end_of_next_half)
          .to eq day_end.call(2026,  9, 30)
      end

      it do
        expect(time.call(2026,  4, 15, 12, 34, 56).end_of_next_half)
          .to eq day_end.call(2027,  3, 31)
      end

      it do
        expect(time.call(2026,  6, 15, 12, 34, 56).end_of_next_half)
          .to eq day_end.call(2027,  3, 31)
      end

      it do
        expect(time.call(2026,  7, 15, 12, 34, 56).end_of_next_half)
          .to eq day_end.call(2027,  3, 31)
      end

      it do
        expect(time.call(2026,  9, 15, 12, 34, 56).end_of_next_half)
          .to eq day_end.call(2027,  3, 31)
      end

      it do
        expect(time.call(2026, 10, 15, 12, 34, 56).end_of_next_half)
          .to eq day_end.call(2027,  9, 30)
      end

      it do
        expect(time.call(2026, 12, 15, 12, 34, 56).end_of_next_half)
          .to eq day_end.call(2027,  9, 30)
      end
    end
  end

  describe "#all_next_half" do
    context "1月始まりの場合（初期値）" do
      it do
        expect(time.call(2026,  1, 15, 12, 34, 56).all_next_half)
          .to eq ::Range.new(day_beginning.call(2026,  7,  1), day_end.call(2026, 12, 31))
      end

      it do
        expect(time.call(2026,  3, 15, 12, 34, 56).all_next_half)
          .to eq ::Range.new(day_beginning.call(2026,  7,  1), day_end.call(2026, 12, 31))
      end

      it do
        expect(time.call(2026,  4, 15, 12, 34, 56).all_next_half)
          .to eq ::Range.new(day_beginning.call(2026,  7,  1), day_end.call(2026, 12, 31))
      end

      it do
        expect(time.call(2026,  6, 15, 12, 34, 56).all_next_half)
          .to eq ::Range.new(day_beginning.call(2026,  7,  1), day_end.call(2026, 12, 31))
      end

      it do
        expect(time.call(2026,  7, 15, 12, 34, 56).all_next_half)
          .to eq ::Range.new(day_beginning.call(2027,  1,  1), day_end.call(2027,  6, 30))
      end

      it do
        expect(time.call(2026,  9, 15, 12, 34, 56).all_next_half)
          .to eq ::Range.new(day_beginning.call(2027,  1,  1), day_end.call(2027,  6, 30))
      end

      it do
        expect(time.call(2026, 10, 15, 12, 34, 56).all_next_half)
          .to eq ::Range.new(day_beginning.call(2027,  1,  1), day_end.call(2027,  6, 30))
      end

      it do
        expect(time.call(2026, 12, 15, 12, 34, 56).all_next_half)
          .to eq ::Range.new(day_beginning.call(2027,  1,  1), day_end.call(2027,  6, 30))
      end
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :april
        end
      end

      it do
        expect(time.call(2026,  1, 15, 12, 34, 56).all_next_half)
          .to eq ::Range.new(day_beginning.call(2026,  4,  1), day_end.call(2026,  9, 30))
      end

      it do
        expect(time.call(2026,  3, 15, 12, 34, 56).all_next_half)
          .to eq ::Range.new(day_beginning.call(2026,  4,  1), day_end.call(2026,  9, 30))
      end

      it do
        expect(time.call(2026,  4, 15, 12, 34, 56).all_next_half)
          .to eq ::Range.new(day_beginning.call(2026, 10,  1), day_end.call(2027,  3, 31))
      end

      it do
        expect(time.call(2026,  6, 15, 12, 34, 56).all_next_half)
          .to eq ::Range.new(day_beginning.call(2026, 10,  1), day_end.call(2027,  3, 31))
      end

      it do
        expect(time.call(2026,  7, 15, 12, 34, 56).all_next_half)
          .to eq ::Range.new(day_beginning.call(2026, 10,  1), day_end.call(2027,  3, 31))
      end

      it do
        expect(time.call(2026,  9, 15, 12, 34, 56).all_next_half)
          .to eq ::Range.new(day_beginning.call(2026, 10,  1), day_end.call(2027,  3, 31))
      end

      it do
        expect(time.call(2026, 10, 15, 12, 34, 56).all_next_half)
          .to eq ::Range.new(day_beginning.call(2027,  4,  1), day_end.call(2027,  9, 30))
      end

      it do
        expect(time.call(2026, 12, 15, 12, 34, 56).all_next_half)
          .to eq ::Range.new(day_beginning.call(2027,  4,  1), day_end.call(2027,  9, 30))
      end
    end
  end

  describe "#beginning_of_prev_half" do
    context "1月始まりの場合（初期値）" do
      it do
        expect(time.call(2026,  1, 15, 12, 34, 56).beginning_of_prev_half)
          .to eq day_beginning.call(2025,  7,  1)
      end

      it do
        expect(time.call(2026,  3, 15, 12, 34, 56).beginning_of_prev_half)
          .to eq day_beginning.call(2025,  7,  1)
      end

      it do
        expect(time.call(2026,  4, 15, 12, 34, 56).beginning_of_prev_half)
          .to eq day_beginning.call(2025,  7,  1)
      end

      it do
        expect(time.call(2026,  6, 15, 12, 34, 56).beginning_of_prev_half)
          .to eq day_beginning.call(2025,  7,  1)
      end

      it do
        expect(time.call(2026,  7, 15, 12, 34, 56).beginning_of_prev_half)
          .to eq day_beginning.call(2026,  1,  1)
      end

      it do
        expect(time.call(2026,  9, 15, 12, 34, 56).beginning_of_prev_half)
          .to eq day_beginning.call(2026,  1,  1)
      end

      it do
        expect(time.call(2026, 10, 15, 12, 34, 56).beginning_of_prev_half)
          .to eq day_beginning.call(2026,  1,  1)
      end

      it do
        expect(time.call(2026, 12, 15, 12, 34, 56).beginning_of_prev_half)
          .to eq day_beginning.call(2026,  1,  1)
      end
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :april
        end
      end

      it do
        expect(time.call(2026,  1, 15, 12, 34, 56).beginning_of_prev_half)
          .to eq day_beginning.call(2025,  4,  1)
      end

      it do
        expect(time.call(2026,  3, 15, 12, 34, 56).beginning_of_prev_half)
          .to eq day_beginning.call(2025,  4,  1)
      end

      it do
        expect(time.call(2026,  4, 15, 12, 34, 56).beginning_of_prev_half)
          .to eq day_beginning.call(2025, 10,  1)
      end

      it do
        expect(time.call(2026,  6, 15, 12, 34, 56).beginning_of_prev_half)
          .to eq day_beginning.call(2025, 10,  1)
      end

      it do
        expect(time.call(2026,  7, 15, 12, 34, 56).beginning_of_prev_half)
          .to eq day_beginning.call(2025, 10,  1)
      end

      it do
        expect(time.call(2026,  9, 15, 12, 34, 56).beginning_of_prev_half)
          .to eq day_beginning.call(2025, 10,  1)
      end

      it do
        expect(time.call(2026, 10, 15, 12, 34, 56).beginning_of_prev_half)
          .to eq day_beginning.call(2026,  4,  1)
      end

      it do
        expect(time.call(2026, 12, 15, 12, 34, 56).beginning_of_prev_half)
          .to eq day_beginning.call(2026,  4,  1)
      end
    end
  end

  describe "#end_of_prev_half" do
    context "1月始まりの場合（初期値）" do
      it do
        expect(time.call(2026,  1, 15, 12, 34, 56).end_of_prev_half)
          .to eq day_end.call(2025, 12, 31)
      end

      it do
        expect(time.call(2026,  3, 15, 12, 34, 56).end_of_prev_half)
          .to eq day_end.call(2025, 12, 31)
      end

      it do
        expect(time.call(2026,  4, 15, 12, 34, 56).end_of_prev_half)
          .to eq day_end.call(2025, 12, 31)
      end

      it do
        expect(time.call(2026,  6, 15, 12, 34, 56).end_of_prev_half)
          .to eq day_end.call(2025, 12, 31)
      end

      it do
        expect(time.call(2026,  7, 15, 12, 34, 56).end_of_prev_half)
          .to eq day_end.call(2026,  6, 30)
      end

      it do
        expect(time.call(2026,  9, 15, 12, 34, 56).end_of_prev_half)
          .to eq day_end.call(2026,  6, 30)
      end

      it do
        expect(time.call(2026, 10, 15, 12, 34, 56).end_of_prev_half)
          .to eq day_end.call(2026,  6, 30)
      end

      it do
        expect(time.call(2026, 12, 15, 12, 34, 56).end_of_prev_half)
          .to eq day_end.call(2026,  6, 30)
      end
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :april
        end
      end

      it do
        expect(time.call(2026,  1, 15, 12, 34, 56).end_of_prev_half)
          .to eq day_end.call(2025,  9, 30)
      end

      it do
        expect(time.call(2026,  3, 15, 12, 34, 56).end_of_prev_half)
          .to eq day_end.call(2025,  9, 30)
      end

      it do
        expect(time.call(2026,  4, 15, 12, 34, 56).end_of_prev_half)
          .to eq day_end.call(2026,  3, 31)
      end

      it do
        expect(time.call(2026,  6, 15, 12, 34, 56).end_of_prev_half)
          .to eq day_end.call(2026,  3, 31)
      end

      it do
        expect(time.call(2026,  7, 15, 12, 34, 56).end_of_prev_half)
          .to eq day_end.call(2026,  3, 31)
      end

      it do
        expect(time.call(2026,  9, 15, 12, 34, 56).end_of_prev_half)
          .to eq day_end.call(2026,  3, 31)
      end

      it do
        expect(time.call(2026, 10, 15, 12, 34, 56).end_of_prev_half)
          .to eq day_end.call(2026,  9, 30)
      end

      it do
        expect(time.call(2026, 12, 15, 12, 34, 56).end_of_prev_half)
          .to eq day_end.call(2026,  9, 30)
      end
    end
  end

  describe "#all_prev_half" do
    context "1月始まりの場合（初期値）" do
      it do
        expect(time.call(2026,  1, 15, 12, 34, 56).all_prev_half)
          .to eq ::Range.new(day_beginning.call(2025,  7,  1), day_end.call(2025, 12, 31))
      end

      it do
        expect(time.call(2026,  3, 15, 12, 34, 56).all_prev_half)
          .to eq ::Range.new(day_beginning.call(2025,  7,  1), day_end.call(2025, 12, 31))
      end

      it do
        expect(time.call(2026,  4, 15, 12, 34, 56).all_prev_half)
          .to eq ::Range.new(day_beginning.call(2025,  7,  1), day_end.call(2025, 12, 31))
      end

      it do
        expect(time.call(2026,  6, 15, 12, 34, 56).all_prev_half)
          .to eq ::Range.new(day_beginning.call(2025,  7,  1), day_end.call(2025, 12, 31))
      end

      it do
        expect(time.call(2026,  7, 15, 12, 34, 56).all_prev_half)
          .to eq ::Range.new(day_beginning.call(2026,  1,  1), day_end.call(2026,  6, 30))
      end

      it do
        expect(time.call(2026,  9, 15, 12, 34, 56).all_prev_half)
          .to eq ::Range.new(day_beginning.call(2026,  1,  1), day_end.call(2026,  6, 30))
      end

      it do
        expect(time.call(2026, 10, 15, 12, 34, 56).all_prev_half)
          .to eq ::Range.new(day_beginning.call(2026,  1,  1), day_end.call(2026,  6, 30))
      end

      it do
        expect(time.call(2026, 12, 15, 12, 34, 56).all_prev_half)
          .to eq ::Range.new(day_beginning.call(2026,  1,  1), day_end.call(2026,  6, 30))
      end
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :april
        end
      end

      it do
        expect(time.call(2026,  1, 15, 12, 34, 56).all_prev_half)
          .to eq ::Range.new(day_beginning.call(2025,  4,  1), day_end.call(2025,  9, 30))
      end

      it do
        expect(time.call(2026,  3, 15, 12, 34, 56).all_prev_half)
          .to eq ::Range.new(day_beginning.call(2025,  4,  1), day_end.call(2025,  9, 30))
      end

      it do
        expect(time.call(2026,  4, 15, 12, 34, 56).all_prev_half)
          .to eq ::Range.new(day_beginning.call(2025, 10,  1), day_end.call(2026,  3, 31))
      end

      it do
        expect(time.call(2026,  6, 15, 12, 34, 56).all_prev_half)
          .to eq ::Range.new(day_beginning.call(2025, 10,  1), day_end.call(2026,  3, 31))
      end

      it do
        expect(time.call(2026,  7, 15, 12, 34, 56).all_prev_half)
          .to eq ::Range.new(day_beginning.call(2025, 10,  1), day_end.call(2026,  3, 31))
      end

      it do
        expect(time.call(2026,  9, 15, 12, 34, 56).all_prev_half)
          .to eq ::Range.new(day_beginning.call(2025, 10,  1), day_end.call(2026,  3, 31))
      end

      it do
        expect(time.call(2026, 10, 15, 12, 34, 56).all_prev_half)
          .to eq ::Range.new(day_beginning.call(2026,  4,  1), day_end.call(2026,  9, 30))
      end

      it do
        expect(time.call(2026, 12, 15, 12, 34, 56).all_prev_half)
          .to eq ::Range.new(day_beginning.call(2026,  4,  1), day_end.call(2026,  9, 30))
      end
    end
  end

  # ###################################################################################################################
  # 年度関係
  # ###################################################################################################################

  describe "#fiscal_year" do
    context "1月始まりの場合（初期値）" do
      it { expect(time.call(2026,  1, 15, 12, 34, 56).fiscal_year).to eq 2026 }
      it { expect(time.call(2026,  3, 15, 12, 34, 56).fiscal_year).to eq 2026 }
      it { expect(time.call(2026,  4, 15, 12, 34, 56).fiscal_year).to eq 2026 }
      it { expect(time.call(2026,  6, 15, 12, 34, 56).fiscal_year).to eq 2026 }
      it { expect(time.call(2026,  7, 15, 12, 34, 56).fiscal_year).to eq 2026 }
      it { expect(time.call(2026,  9, 15, 12, 34, 56).fiscal_year).to eq 2026 }
      it { expect(time.call(2026, 10, 15, 12, 34, 56).fiscal_year).to eq 2026 }
      it { expect(time.call(2026, 12, 15, 12, 34, 56).fiscal_year).to eq 2026 }
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :april
        end
      end

      it { expect(time.call(2026,  1, 15, 12, 34, 56).fiscal_year).to eq 2025 }
      it { expect(time.call(2026,  3, 15, 12, 34, 56).fiscal_year).to eq 2025 }
      it { expect(time.call(2026,  4, 15, 12, 34, 56).fiscal_year).to eq 2026 }
      it { expect(time.call(2026,  6, 15, 12, 34, 56).fiscal_year).to eq 2026 }
      it { expect(time.call(2026,  7, 15, 12, 34, 56).fiscal_year).to eq 2026 }
      it { expect(time.call(2026,  9, 15, 12, 34, 56).fiscal_year).to eq 2026 }
      it { expect(time.call(2026, 10, 15, 12, 34, 56).fiscal_year).to eq 2026 }
      it { expect(time.call(2026, 12, 15, 12, 34, 56).fiscal_year).to eq 2026 }
    end
  end

  describe "#beginning_of_fiscal_year" do
    context "1月始まりの場合（初期値）" do
      it { expect(time.call(2026,  1, 15, 12, 34, 56).beginning_of_fiscal_year).to eq day_beginning.call(2026,  1,  1) }
      it { expect(time.call(2026,  3, 15, 12, 34, 56).beginning_of_fiscal_year).to eq day_beginning.call(2026,  1,  1) }
      it { expect(time.call(2026,  4, 15, 12, 34, 56).beginning_of_fiscal_year).to eq day_beginning.call(2026,  1,  1) }
      it { expect(time.call(2026,  6, 15, 12, 34, 56).beginning_of_fiscal_year).to eq day_beginning.call(2026,  1,  1) }
      it { expect(time.call(2026,  7, 15, 12, 34, 56).beginning_of_fiscal_year).to eq day_beginning.call(2026,  1,  1) }
      it { expect(time.call(2026,  9, 15, 12, 34, 56).beginning_of_fiscal_year).to eq day_beginning.call(2026,  1,  1) }
      it { expect(time.call(2026, 10, 15, 12, 34, 56).beginning_of_fiscal_year).to eq day_beginning.call(2026,  1,  1) }
      it { expect(time.call(2026, 12, 15, 12, 34, 56).beginning_of_fiscal_year).to eq day_beginning.call(2026,  1,  1) }
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :april
        end
      end

      it { expect(time.call(2026,  1, 15, 12, 34, 56).beginning_of_fiscal_year).to eq day_beginning.call(2025,  4,  1) }
      it { expect(time.call(2026,  3, 15, 12, 34, 56).beginning_of_fiscal_year).to eq day_beginning.call(2025,  4,  1) }
      it { expect(time.call(2026,  4, 15, 12, 34, 56).beginning_of_fiscal_year).to eq day_beginning.call(2026,  4,  1) }
      it { expect(time.call(2026,  6, 15, 12, 34, 56).beginning_of_fiscal_year).to eq day_beginning.call(2026,  4,  1) }
      it { expect(time.call(2026,  7, 15, 12, 34, 56).beginning_of_fiscal_year).to eq day_beginning.call(2026,  4,  1) }
      it { expect(time.call(2026,  9, 15, 12, 34, 56).beginning_of_fiscal_year).to eq day_beginning.call(2026,  4,  1) }
      it { expect(time.call(2026, 10, 15, 12, 34, 56).beginning_of_fiscal_year).to eq day_beginning.call(2026,  4,  1) }
      it { expect(time.call(2026, 12, 15, 12, 34, 56).beginning_of_fiscal_year).to eq day_beginning.call(2026,  4,  1) }
    end
  end

  describe "#end_of_fiscal_year" do
    context "1月始まりの場合（初期値）" do
      it { expect(time.call(2026,  1, 15, 12, 34, 56).end_of_fiscal_year).to eq day_end.call(2026, 12, 31) }
      it { expect(time.call(2026,  3, 15, 12, 34, 56).end_of_fiscal_year).to eq day_end.call(2026, 12, 31) }
      it { expect(time.call(2026,  4, 15, 12, 34, 56).end_of_fiscal_year).to eq day_end.call(2026, 12, 31) }
      it { expect(time.call(2026,  6, 15, 12, 34, 56).end_of_fiscal_year).to eq day_end.call(2026, 12, 31) }
      it { expect(time.call(2026,  7, 15, 12, 34, 56).end_of_fiscal_year).to eq day_end.call(2026, 12, 31) }
      it { expect(time.call(2026,  9, 15, 12, 34, 56).end_of_fiscal_year).to eq day_end.call(2026, 12, 31) }
      it { expect(time.call(2026, 10, 15, 12, 34, 56).end_of_fiscal_year).to eq day_end.call(2026, 12, 31) }
      it { expect(time.call(2026, 12, 15, 12, 34, 56).end_of_fiscal_year).to eq day_end.call(2026, 12, 31) }
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :april
        end
      end

      it { expect(time.call(2026,  1, 15, 12, 34, 56).end_of_fiscal_year).to eq day_end.call(2026,  3, 31) }
      it { expect(time.call(2026,  3, 15, 12, 34, 56).end_of_fiscal_year).to eq day_end.call(2026,  3, 31) }
      it { expect(time.call(2026,  4, 15, 12, 34, 56).end_of_fiscal_year).to eq day_end.call(2027,  3, 31) }
      it { expect(time.call(2026,  6, 15, 12, 34, 56).end_of_fiscal_year).to eq day_end.call(2027,  3, 31) }
      it { expect(time.call(2026,  7, 15, 12, 34, 56).end_of_fiscal_year).to eq day_end.call(2027,  3, 31) }
      it { expect(time.call(2026,  9, 15, 12, 34, 56).end_of_fiscal_year).to eq day_end.call(2027,  3, 31) }
      it { expect(time.call(2026, 10, 15, 12, 34, 56).end_of_fiscal_year).to eq day_end.call(2027,  3, 31) }
      it { expect(time.call(2026, 12, 15, 12, 34, 56).end_of_fiscal_year).to eq day_end.call(2027,  3, 31) }
    end
  end

  describe "#all_fiscal_year" do
    context "1月始まりの場合（初期値）" do
      it do
        expect(time.call(2026,  1, 15, 12, 34, 56).all_fiscal_year)
          .to eq ::Range.new(day_beginning.call(2026,  1,  1), day_end.call(2026, 12, 31))
      end

      it do
        expect(time.call(2026,  3, 15, 12, 34, 56).all_fiscal_year)
          .to eq ::Range.new(day_beginning.call(2026,  1,  1), day_end.call(2026, 12, 31))
      end

      it do
        expect(time.call(2026,  4, 15, 12, 34, 56).all_fiscal_year)
          .to eq ::Range.new(day_beginning.call(2026,  1,  1), day_end.call(2026, 12, 31))
      end

      it do
        expect(time.call(2026,  6, 15, 12, 34, 56).all_fiscal_year)
          .to eq ::Range.new(day_beginning.call(2026,  1,  1), day_end.call(2026, 12, 31))
      end

      it do
        expect(time.call(2026,  7, 15, 12, 34, 56).all_fiscal_year)
          .to eq ::Range.new(day_beginning.call(2026,  1,  1), day_end.call(2026, 12, 31))
      end

      it do
        expect(time.call(2026,  9, 15, 12, 34, 56).all_fiscal_year)
          .to eq ::Range.new(day_beginning.call(2026,  1,  1), day_end.call(2026, 12, 31))
      end

      it do
        expect(time.call(2026, 10, 15, 12, 34, 56).all_fiscal_year)
          .to eq ::Range.new(day_beginning.call(2026,  1,  1), day_end.call(2026, 12, 31))
      end

      it do
        expect(time.call(2026, 12, 15, 12, 34, 56).all_fiscal_year)
          .to eq ::Range.new(day_beginning.call(2026,  1,  1), day_end.call(2026, 12, 31))
      end
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :april
        end
      end

      it do
        expect(time.call(2026,  1, 15, 12, 34, 56).all_fiscal_year)
          .to eq ::Range.new(day_beginning.call(2025,  4,  1), day_end.call(2026,  3, 31))
      end

      it do
        expect(time.call(2026,  3, 15, 12, 34, 56).all_fiscal_year)
          .to eq ::Range.new(day_beginning.call(2025,  4,  1), day_end.call(2026,  3, 31))
      end

      it do
        expect(time.call(2026,  4, 15, 12, 34, 56).all_fiscal_year)
          .to eq ::Range.new(day_beginning.call(2026,  4,  1), day_end.call(2027,  3, 31))
      end

      it do
        expect(time.call(2026,  6, 15, 12, 34, 56).all_fiscal_year)
          .to eq ::Range.new(day_beginning.call(2026,  4,  1), day_end.call(2027,  3, 31))
      end

      it do
        expect(time.call(2026,  7, 15, 12, 34, 56).all_fiscal_year)
          .to eq ::Range.new(day_beginning.call(2026,  4,  1), day_end.call(2027,  3, 31))
      end

      it do
        expect(time.call(2026,  9, 15, 12, 34, 56).all_fiscal_year)
          .to eq ::Range.new(day_beginning.call(2026,  4,  1), day_end.call(2027,  3, 31))
      end

      it do
        expect(time.call(2026, 10, 15, 12, 34, 56).all_fiscal_year)
          .to eq ::Range.new(day_beginning.call(2026,  4,  1), day_end.call(2027,  3, 31))
      end

      it do
        expect(time.call(2026, 12, 15, 12, 34, 56).all_fiscal_year)
          .to eq ::Range.new(day_beginning.call(2026,  4,  1), day_end.call(2027,  3, 31))
      end
    end
  end

  describe "#next_fiscal_year" do
    context "1月始まりの場合（初期値）" do
      it { expect(time.call(2026,  1, 15, 12, 34, 56).next_fiscal_year).to eq 2027 }
      it { expect(time.call(2026,  3, 15, 12, 34, 56).next_fiscal_year).to eq 2027 }
      it { expect(time.call(2026,  4, 15, 12, 34, 56).next_fiscal_year).to eq 2027 }
      it { expect(time.call(2026,  6, 15, 12, 34, 56).next_fiscal_year).to eq 2027 }
      it { expect(time.call(2026,  7, 15, 12, 34, 56).next_fiscal_year).to eq 2027 }
      it { expect(time.call(2026,  9, 15, 12, 34, 56).next_fiscal_year).to eq 2027 }
      it { expect(time.call(2026, 10, 15, 12, 34, 56).next_fiscal_year).to eq 2027 }
      it { expect(time.call(2026, 12, 15, 12, 34, 56).next_fiscal_year).to eq 2027 }
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :april
        end
      end

      it { expect(time.call(2026,  1, 15, 12, 34, 56).next_fiscal_year).to eq 2026 }
      it { expect(time.call(2026,  3, 15, 12, 34, 56).next_fiscal_year).to eq 2026 }
      it { expect(time.call(2026,  4, 15, 12, 34, 56).next_fiscal_year).to eq 2027 }
      it { expect(time.call(2026,  6, 15, 12, 34, 56).next_fiscal_year).to eq 2027 }
      it { expect(time.call(2026,  7, 15, 12, 34, 56).next_fiscal_year).to eq 2027 }
      it { expect(time.call(2026,  9, 15, 12, 34, 56).next_fiscal_year).to eq 2027 }
      it { expect(time.call(2026, 10, 15, 12, 34, 56).next_fiscal_year).to eq 2027 }
      it { expect(time.call(2026, 12, 15, 12, 34, 56).next_fiscal_year).to eq 2027 }
    end
  end

  describe "#beginning_of_next_fiscal_year" do
    context "1月始まりの場合（初期値）" do
      it do
        expect(time.call(2026,  1, 15, 12, 34, 56).beginning_of_next_fiscal_year)
          .to eq day_beginning.call(2027,  1,  1)
      end

      it do
        expect(time.call(2026,  3, 15, 12, 34, 56).beginning_of_next_fiscal_year)
          .to eq day_beginning.call(2027,  1,  1)
      end

      it do
        expect(time.call(2026,  4, 15, 12, 34, 56).beginning_of_next_fiscal_year)
          .to eq day_beginning.call(2027,  1,  1)
      end

      it do
        expect(time.call(2026,  6, 15, 12, 34, 56).beginning_of_next_fiscal_year)
          .to eq day_beginning.call(2027,  1,  1)
      end

      it do
        expect(time.call(2026,  7, 15, 12, 34, 56).beginning_of_next_fiscal_year)
          .to eq day_beginning.call(2027,  1,  1)
      end

      it do
        expect(time.call(2026,  9, 15, 12, 34, 56).beginning_of_next_fiscal_year)
          .to eq day_beginning.call(2027,  1,  1)
      end

      it do
        expect(time.call(2026, 10, 15, 12, 34, 56).beginning_of_next_fiscal_year)
          .to eq day_beginning.call(2027,  1,  1)
      end

      it do
        expect(time.call(2026, 12, 15, 12, 34, 56).beginning_of_next_fiscal_year)
          .to eq day_beginning.call(2027,  1,  1)
      end
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :april
        end
      end

      it do
        expect(time.call(2026,  1, 15, 12, 34, 56).beginning_of_next_fiscal_year)
          .to eq day_beginning.call(2026,  4,  1)
      end

      it do
        expect(time.call(2026,  3, 15, 12, 34, 56).beginning_of_next_fiscal_year)
          .to eq day_beginning.call(2026,  4,  1)
      end

      it do
        expect(time.call(2026,  4, 15, 12, 34, 56).beginning_of_next_fiscal_year)
          .to eq day_beginning.call(2027,  4,  1)
      end

      it do
        expect(time.call(2026,  6, 15, 12, 34, 56).beginning_of_next_fiscal_year)
          .to eq day_beginning.call(2027,  4,  1)
      end

      it do
        expect(time.call(2026,  7, 15, 12, 34, 56).beginning_of_next_fiscal_year)
          .to eq day_beginning.call(2027,  4,  1)
      end

      it do
        expect(time.call(2026,  9, 15, 12, 34, 56).beginning_of_next_fiscal_year)
          .to eq day_beginning.call(2027,  4,  1)
      end

      it do
        expect(time.call(2026, 10, 15, 12, 34, 56).beginning_of_next_fiscal_year)
          .to eq day_beginning.call(2027,  4,  1)
      end

      it do
        expect(time.call(2026, 12, 15, 12, 34, 56).beginning_of_next_fiscal_year)
          .to eq day_beginning.call(2027,  4,  1)
      end
    end
  end

  describe "#end_of_next_fiscal_year" do
    context "1月始まりの場合（初期値）" do
      it do
        expect(time.call(2026,  1, 15, 12, 34, 56).end_of_next_fiscal_year)
          .to eq day_end.call(2027, 12, 31)
      end

      it do
        expect(time.call(2026,  3, 15, 12, 34, 56).end_of_next_fiscal_year)
          .to eq day_end.call(2027, 12, 31)
      end

      it do
        expect(time.call(2026,  4, 15, 12, 34, 56).end_of_next_fiscal_year)
          .to eq day_end.call(2027, 12, 31)
      end

      it do
        expect(time.call(2026,  6, 15, 12, 34, 56).end_of_next_fiscal_year)
          .to eq day_end.call(2027, 12, 31)
      end

      it do
        expect(time.call(2026,  7, 15, 12, 34, 56).end_of_next_fiscal_year)
          .to eq day_end.call(2027, 12, 31)
      end

      it do
        expect(time.call(2026,  9, 15, 12, 34, 56).end_of_next_fiscal_year)
          .to eq day_end.call(2027, 12, 31)
      end

      it do
        expect(time.call(2026, 10, 15, 12, 34, 56).end_of_next_fiscal_year)
          .to eq day_end.call(2027, 12, 31)
      end

      it do
        expect(time.call(2026, 12, 15, 12, 34, 56).end_of_next_fiscal_year)
          .to eq day_end.call(2027, 12, 31)
      end
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :april
        end
      end

      it do
        expect(time.call(2026,  1, 15, 12, 34, 56).end_of_next_fiscal_year)
          .to eq day_end.call(2027,  3, 31)
      end

      it do
        expect(time.call(2026,  3, 15, 12, 34, 56).end_of_next_fiscal_year)
          .to eq day_end.call(2027,  3, 31)
      end

      it do
        expect(time.call(2026,  4, 15, 12, 34, 56).end_of_next_fiscal_year)
          .to eq day_end.call(2028,  3, 31)
      end

      it do
        expect(time.call(2026,  6, 15, 12, 34, 56).end_of_next_fiscal_year)
          .to eq day_end.call(2028,  3, 31)
      end

      it do
        expect(time.call(2026,  7, 15, 12, 34, 56).end_of_next_fiscal_year)
          .to eq day_end.call(2028,  3, 31)
      end

      it do
        expect(time.call(2026,  9, 15, 12, 34, 56).end_of_next_fiscal_year)
          .to eq day_end.call(2028,  3, 31)
      end

      it do
        expect(time.call(2026, 10, 15, 12, 34, 56).end_of_next_fiscal_year)
          .to eq day_end.call(2028,  3, 31)
      end

      it do
        expect(time.call(2026, 12, 15, 12, 34, 56).end_of_next_fiscal_year)
          .to eq day_end.call(2028,  3, 31)
      end
    end
  end

  describe "#all_next_fiscal_year" do
    context "1月始まりの場合（初期値）" do
      it do
        expect(time.call(2026,  1, 15, 12, 34, 56).all_next_fiscal_year)
          .to eq ::Range.new(day_beginning.call(2027,  1,  1), day_end.call(2027, 12, 31))
      end

      it do
        expect(time.call(2026,  3, 15, 12, 34, 56).all_next_fiscal_year)
          .to eq ::Range.new(day_beginning.call(2027,  1,  1), day_end.call(2027, 12, 31))
      end

      it do
        expect(time.call(2026,  4, 15, 12, 34, 56).all_next_fiscal_year)
          .to eq ::Range.new(day_beginning.call(2027,  1,  1), day_end.call(2027, 12, 31))
      end

      it do
        expect(time.call(2026,  6, 15, 12, 34, 56).all_next_fiscal_year)
          .to eq ::Range.new(day_beginning.call(2027,  1,  1), day_end.call(2027, 12, 31))
      end

      it do
        expect(time.call(2026,  7, 15, 12, 34, 56).all_next_fiscal_year)
          .to eq ::Range.new(day_beginning.call(2027,  1,  1), day_end.call(2027, 12, 31))
      end

      it do
        expect(time.call(2026,  9, 15, 12, 34, 56).all_next_fiscal_year)
          .to eq ::Range.new(day_beginning.call(2027,  1,  1), day_end.call(2027, 12, 31))
      end

      it do
        expect(time.call(2026, 10, 15, 12, 34, 56).all_next_fiscal_year)
          .to eq ::Range.new(day_beginning.call(2027,  1,  1), day_end.call(2027, 12, 31))
      end

      it do
        expect(time.call(2026, 12, 15, 12, 34, 56).all_next_fiscal_year)
          .to eq ::Range.new(day_beginning.call(2027,  1,  1), day_end.call(2027, 12, 31))
      end
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :april
        end
      end

      it do
        expect(time.call(2026,  1, 15, 12, 34, 56).all_next_fiscal_year)
          .to eq ::Range.new(day_beginning.call(2026,  4,  1), day_end.call(2027,  3, 31))
      end

      it do
        expect(time.call(2026,  3, 15, 12, 34, 56).all_next_fiscal_year)
          .to eq ::Range.new(day_beginning.call(2026,  4,  1), day_end.call(2027,  3, 31))
      end

      it do
        expect(time.call(2026,  4, 15, 12, 34, 56).all_next_fiscal_year)
          .to eq ::Range.new(day_beginning.call(2027,  4,  1), day_end.call(2028,  3, 31))
      end

      it do
        expect(time.call(2026,  6, 15, 12, 34, 56).all_next_fiscal_year)
          .to eq ::Range.new(day_beginning.call(2027,  4,  1), day_end.call(2028,  3, 31))
      end

      it do
        expect(time.call(2026,  7, 15, 12, 34, 56).all_next_fiscal_year)
          .to eq ::Range.new(day_beginning.call(2027,  4,  1), day_end.call(2028,  3, 31))
      end

      it do
        expect(time.call(2026,  9, 15, 12, 34, 56).all_next_fiscal_year)
          .to eq ::Range.new(day_beginning.call(2027,  4,  1), day_end.call(2028,  3, 31))
      end

      it do
        expect(time.call(2026, 10, 15, 12, 34, 56).all_next_fiscal_year)
          .to eq ::Range.new(day_beginning.call(2027,  4,  1), day_end.call(2028,  3, 31))
      end

      it do
        expect(time.call(2026, 12, 15, 12, 34, 56).all_next_fiscal_year)
          .to eq ::Range.new(day_beginning.call(2027,  4,  1), day_end.call(2028,  3, 31))
      end
    end
  end

  describe "#prev_fiscal_year" do
    context "1月始まりの場合（初期値）" do
      it { expect(time.call(2026,  1, 15, 12, 34, 56).prev_fiscal_year).to eq 2025 }
      it { expect(time.call(2026,  3, 15, 12, 34, 56).prev_fiscal_year).to eq 2025 }
      it { expect(time.call(2026,  4, 15, 12, 34, 56).prev_fiscal_year).to eq 2025 }
      it { expect(time.call(2026,  6, 15, 12, 34, 56).prev_fiscal_year).to eq 2025 }
      it { expect(time.call(2026,  7, 15, 12, 34, 56).prev_fiscal_year).to eq 2025 }
      it { expect(time.call(2026,  9, 15, 12, 34, 56).prev_fiscal_year).to eq 2025 }
      it { expect(time.call(2026, 10, 15, 12, 34, 56).prev_fiscal_year).to eq 2025 }
      it { expect(time.call(2026, 12, 15, 12, 34, 56).prev_fiscal_year).to eq 2025 }
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :april
        end
      end

      it { expect(time.call(2026,  1, 15, 12, 34, 56).prev_fiscal_year).to eq 2024 }
      it { expect(time.call(2026,  3, 15, 12, 34, 56).prev_fiscal_year).to eq 2024 }
      it { expect(time.call(2026,  4, 15, 12, 34, 56).prev_fiscal_year).to eq 2025 }
      it { expect(time.call(2026,  6, 15, 12, 34, 56).prev_fiscal_year).to eq 2025 }
      it { expect(time.call(2026,  7, 15, 12, 34, 56).prev_fiscal_year).to eq 2025 }
      it { expect(time.call(2026,  9, 15, 12, 34, 56).prev_fiscal_year).to eq 2025 }
      it { expect(time.call(2026, 10, 15, 12, 34, 56).prev_fiscal_year).to eq 2025 }
      it { expect(time.call(2026, 12, 15, 12, 34, 56).prev_fiscal_year).to eq 2025 }
    end
  end

  describe "#beginning_of_prev_fiscal_year" do
    context "1月始まりの場合（初期値）" do
      it do
        expect(time.call(2026,  1, 15, 12, 34, 56).beginning_of_prev_fiscal_year)
          .to eq day_beginning.call(2025,  1,  1)
      end

      it do
        expect(time.call(2026,  3, 15, 12, 34, 56).beginning_of_prev_fiscal_year)
          .to eq day_beginning.call(2025,  1,  1)
      end

      it do
        expect(time.call(2026,  4, 15, 12, 34, 56).beginning_of_prev_fiscal_year)
          .to eq day_beginning.call(2025,  1,  1)
      end

      it do
        expect(time.call(2026,  6, 15, 12, 34, 56).beginning_of_prev_fiscal_year)
          .to eq day_beginning.call(2025,  1,  1)
      end

      it do
        expect(time.call(2026,  7, 15, 12, 34, 56).beginning_of_prev_fiscal_year)
          .to eq day_beginning.call(2025,  1,  1)
      end

      it do
        expect(time.call(2026,  9, 15, 12, 34, 56).beginning_of_prev_fiscal_year)
          .to eq day_beginning.call(2025,  1,  1)
      end

      it do
        expect(time.call(2026, 10, 15, 12, 34, 56).beginning_of_prev_fiscal_year)
          .to eq day_beginning.call(2025,  1,  1)
      end

      it do
        expect(time.call(2026, 12, 15, 12, 34, 56).beginning_of_prev_fiscal_year)
          .to eq day_beginning.call(2025,  1,  1)
      end
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :april
        end
      end

      it do
        expect(time.call(2026,  1, 15, 12, 34, 56).beginning_of_prev_fiscal_year)
          .to eq day_beginning.call(2024,  4,  1)
      end

      it do
        expect(time.call(2026,  3, 15, 12, 34, 56).beginning_of_prev_fiscal_year)
          .to eq day_beginning.call(2024,  4,  1)
      end

      it do
        expect(time.call(2026,  4, 15, 12, 34, 56).beginning_of_prev_fiscal_year)
          .to eq day_beginning.call(2025,  4,  1)
      end

      it do
        expect(time.call(2026,  6, 15, 12, 34, 56).beginning_of_prev_fiscal_year)
          .to eq day_beginning.call(2025,  4,  1)
      end

      it do
        expect(time.call(2026,  7, 15, 12, 34, 56).beginning_of_prev_fiscal_year)
          .to eq day_beginning.call(2025,  4,  1)
      end

      it do
        expect(time.call(2026,  9, 15, 12, 34, 56).beginning_of_prev_fiscal_year)
          .to eq day_beginning.call(2025,  4,  1)
      end

      it do
        expect(time.call(2026, 10, 15, 12, 34, 56).beginning_of_prev_fiscal_year)
          .to eq day_beginning.call(2025,  4,  1)
      end

      it do
        expect(time.call(2026, 12, 15, 12, 34, 56).beginning_of_prev_fiscal_year)
          .to eq day_beginning.call(2025,  4,  1)
      end
    end
  end

  describe "#end_of_prev_fiscal_year" do
    context "1月始まりの場合（初期値）" do
      it do
        expect(time.call(2026,  1, 15, 12, 34, 56).end_of_prev_fiscal_year)
          .to eq day_end.call(2025, 12, 31)
      end

      it do
        expect(time.call(2026,  3, 15, 12, 34, 56).end_of_prev_fiscal_year)
          .to eq day_end.call(2025, 12, 31)
      end

      it do
        expect(time.call(2026,  4, 15, 12, 34, 56).end_of_prev_fiscal_year)
          .to eq day_end.call(2025, 12, 31)
      end

      it do
        expect(time.call(2026,  6, 15, 12, 34, 56).end_of_prev_fiscal_year)
          .to eq day_end.call(2025, 12, 31)
      end

      it do
        expect(time.call(2026,  7, 15, 12, 34, 56).end_of_prev_fiscal_year)
          .to eq day_end.call(2025, 12, 31)
      end

      it do
        expect(time.call(2026,  9, 15, 12, 34, 56).end_of_prev_fiscal_year)
          .to eq day_end.call(2025, 12, 31)
      end

      it do
        expect(time.call(2026, 10, 15, 12, 34, 56).end_of_prev_fiscal_year)
          .to eq day_end.call(2025, 12, 31)
      end

      it do
        expect(time.call(2026, 12, 15, 12, 34, 56).end_of_prev_fiscal_year)
          .to eq day_end.call(2025, 12, 31)
      end
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :april
        end
      end

      it do
        expect(time.call(2026,  1, 15, 12, 34, 56).end_of_prev_fiscal_year)
          .to eq day_end.call(2025,  3, 31)
      end

      it do
        expect(time.call(2026,  3, 15, 12, 34, 56).end_of_prev_fiscal_year)
          .to eq day_end.call(2025,  3, 31)
      end

      it do
        expect(time.call(2026,  4, 15, 12, 34, 56).end_of_prev_fiscal_year)
          .to eq day_end.call(2026,  3, 31)
      end

      it do
        expect(time.call(2026,  6, 15, 12, 34, 56).end_of_prev_fiscal_year)
          .to eq day_end.call(2026,  3, 31)
      end

      it do
        expect(time.call(2026,  7, 15, 12, 34, 56).end_of_prev_fiscal_year)
          .to eq day_end.call(2026,  3, 31)
      end

      it do
        expect(time.call(2026,  9, 15, 12, 34, 56).end_of_prev_fiscal_year)
          .to eq day_end.call(2026,  3, 31)
      end

      it do
        expect(time.call(2026, 10, 15, 12, 34, 56).end_of_prev_fiscal_year)
          .to eq day_end.call(2026,  3, 31)
      end

      it do
        expect(time.call(2026, 12, 15, 12, 34, 56).end_of_prev_fiscal_year)
          .to eq day_end.call(2026,  3, 31)
      end
    end
  end

  describe "#all_prev_fiscal_year" do
    context "1月始まりの場合（初期値）" do
      it do
        expect(time.call(2026,  1, 15, 12, 34, 56).all_prev_fiscal_year)
          .to eq ::Range.new(day_beginning.call(2025,  1,  1), day_end.call(2025, 12, 31))
      end

      it do
        expect(time.call(2026,  3, 15, 12, 34, 56).all_prev_fiscal_year)
          .to eq ::Range.new(day_beginning.call(2025,  1,  1), day_end.call(2025, 12, 31))
      end

      it do
        expect(time.call(2026,  4, 15, 12, 34, 56).all_prev_fiscal_year)
          .to eq ::Range.new(day_beginning.call(2025,  1,  1), day_end.call(2025, 12, 31))
      end

      it do
        expect(time.call(2026,  6, 15, 12, 34, 56).all_prev_fiscal_year)
          .to eq ::Range.new(day_beginning.call(2025,  1,  1), day_end.call(2025, 12, 31))
      end

      it do
        expect(time.call(2026,  7, 15, 12, 34, 56).all_prev_fiscal_year)
          .to eq ::Range.new(day_beginning.call(2025,  1,  1), day_end.call(2025, 12, 31))
      end

      it do
        expect(time.call(2026,  9, 15, 12, 34, 56).all_prev_fiscal_year)
          .to eq ::Range.new(day_beginning.call(2025,  1,  1), day_end.call(2025, 12, 31))
      end

      it do
        expect(time.call(2026, 10, 15, 12, 34, 56).all_prev_fiscal_year)
          .to eq ::Range.new(day_beginning.call(2025,  1,  1), day_end.call(2025, 12, 31))
      end

      it do
        expect(time.call(2026, 12, 15, 12, 34, 56).all_prev_fiscal_year)
          .to eq ::Range.new(day_beginning.call(2025,  1,  1), day_end.call(2025, 12, 31))
      end
    end

    context "4月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :april
        end
      end

      it do
        expect(time.call(2026,  1, 15, 12, 34, 56).all_prev_fiscal_year)
          .to eq ::Range.new(day_beginning.call(2024,  4,  1), day_end.call(2025,  3, 31))
      end

      it do
        expect(time.call(2026,  3, 15, 12, 34, 56).all_prev_fiscal_year)
          .to eq ::Range.new(day_beginning.call(2024,  4,  1), day_end.call(2025,  3, 31))
      end

      it do
        expect(time.call(2026,  4, 15, 12, 34, 56).all_prev_fiscal_year)
          .to eq ::Range.new(day_beginning.call(2025,  4,  1), day_end.call(2026,  3, 31))
      end

      it do
        expect(time.call(2026,  6, 15, 12, 34, 56).all_prev_fiscal_year)
          .to eq ::Range.new(day_beginning.call(2025,  4,  1), day_end.call(2026,  3, 31))
      end

      it do
        expect(time.call(2026,  7, 15, 12, 34, 56).all_prev_fiscal_year)
          .to eq ::Range.new(day_beginning.call(2025,  4,  1), day_end.call(2026,  3, 31))
      end

      it do
        expect(time.call(2026,  9, 15, 12, 34, 56).all_prev_fiscal_year)
          .to eq ::Range.new(day_beginning.call(2025,  4,  1), day_end.call(2026,  3, 31))
      end

      it do
        expect(time.call(2026, 10, 15, 12, 34, 56).all_prev_fiscal_year)
          .to eq ::Range.new(day_beginning.call(2025,  4,  1), day_end.call(2026,  3, 31))
      end

      it do
        expect(time.call(2026, 12, 15, 12, 34, 56).all_prev_fiscal_year)
          .to eq ::Range.new(day_beginning.call(2025,  4,  1), day_end.call(2026,  3, 31))
      end
    end
  end

  # ###################################################################################################################
  # 満経過月数
  # ###################################################################################################################

  describe ".whole_months_elapsed" do
    subject { described_class.whole_months_elapsed(from:, to:) }

    let(:from) { time.call(2026, 8, 5) }
    let(:to) { time.call(2026, 9, 5) }

    context "1月以内の場合" do
      let(:from) { time.call(2026, 8, 5) }
      let(:to) { time.call(2026, 9, 4) }

      it { is_expected.to eq(0) }
    end

    context "1月ちょうどの場合" do
      let(:from) { time.call(2026, 8, 5) }
      let(:to) { time.call(2026, 9, 5) }

      it { is_expected.to eq(1) }
    end

    context "1月を超える場合" do
      let(:from) { time.call(2026, 8, 5) }
      let(:to) { time.call(2026, 9, 6) }

      it { is_expected.to eq(1) }
    end

    context "1年以内の場合" do
      let(:from) { time.call(2026, 8, 5) }
      let(:to) { time.call(2027, 8, 4) }

      it { is_expected.to eq(11) }
    end

    context "1年ちょうどの場合" do
      let(:from) { time.call(2026, 8, 5) }
      let(:to) { time.call(2027, 8, 5) }

      it { is_expected.to eq(12) }
    end

    context "1年を超える場合" do
      let(:from) { time.call(2026, 8, 5) }
      let(:to) { time.call(2027, 8, 6) }

      it { is_expected.to eq(12) }
    end

    context "同日の場合" do
      context "fromとtoが同じ" do
        let(:from) { time.call(2026, 8, 5) }
        let(:to) { time.call(2026, 8, 5) }

        it { is_expected.to eq(0) }
      end

      context "toの時刻がfromより前" do
        let(:from) { time.call(2026, 8, 5, 18, 0, 0) }
        let(:to) { time.call(2026, 8, 5, 9, 0, 0) }

        it { is_expected.to eq(0) }
      end
    end

    context "応当日で時刻のみ異なる場合" do
      context "toの時刻がfromより前" do
        let(:from) { time.call(2026, 8, 5, 18, 0, 0) }
        let(:to) { time.call(2026, 9, 5, 9, 0, 0) }

        it { is_expected.to eq(1) }
      end

      context "応当日の前日でtoの時刻がfromより後" do
        let(:from) { time.call(2026, 8, 5, 9, 0, 0) }
        let(:to) { time.call(2026, 9, 4, 18, 0, 0) }

        it { is_expected.to eq(0) }
      end
    end

    context "応当日が存在しない月の場合" do
      context "応当日の前日" do
        let(:from) { time.call(2026, 1, 31) }
        let(:to) { time.call(2026, 2, 27) }

        it { is_expected.to eq(0) }
      end

      context "応当日（2月末日）" do
        let(:from) { time.call(2026, 1, 31) }
        let(:to) { time.call(2026, 2, 28) }

        it { is_expected.to eq(1) }
      end

      context "応当日の翌日" do
        let(:from) { time.call(2026, 1, 31) }
        let(:to) { time.call(2026, 3, 1) }

        it { is_expected.to eq(1) }
      end

      context "30日までしかない月の末日" do
        let(:from) { time.call(2026, 3, 31) }
        let(:to) { time.call(2026, 4, 30) }

        it { is_expected.to eq(1) }
      end

      context "fromが30日で2月末日" do
        let(:from) { time.call(2026, 1, 30) }
        let(:to) { time.call(2026, 2, 28) }

        it { is_expected.to eq(1) }
      end

      context "応当日が存在する月まで進めた場合" do
        let(:from) { time.call(2026, 1, 31) }
        let(:to) { time.call(2026, 3, 31) }

        it { is_expected.to eq(2) }
      end
    end

    context "fromが月末日の場合（起算日が月初となる）" do
      context "応当日" do
        let(:from) { time.call(2026, 2, 28) }
        let(:to) { time.call(2026, 3, 28) }

        it { is_expected.to eq(0) }
      end

      context "満了日の前日" do
        let(:from) { time.call(2026, 2, 28) }
        let(:to) { time.call(2026, 3, 30) }

        it { is_expected.to eq(0) }
      end

      context "満了日（起算月の末日）" do
        let(:from) { time.call(2026, 2, 28) }
        let(:to) { time.call(2026, 3, 31) }

        it { is_expected.to eq(1) }
      end

      context "30日までしかない月から31日ある月へ" do
        let(:from) { time.call(2026, 4, 30) }
        let(:to) { time.call(2026, 5, 30) }

        it { is_expected.to eq(0) }
      end

      context "30日までしかない月から31日ある月への満了日" do
        let(:from) { time.call(2026, 4, 30) }
        let(:to) { time.call(2026, 5, 31) }

        it { is_expected.to eq(1) }
      end
    end

    context "閏年が絡む場合" do
      context "閏年の2月28日（応当日未到達）" do
        let(:from) { time.call(2024, 1, 31) }
        let(:to) { time.call(2024, 2, 28) }

        it { is_expected.to eq(0) }
      end

      context "閏年の2月29日（応当日）" do
        let(:from) { time.call(2024, 1, 31) }
        let(:to) { time.call(2024, 2, 29) }

        it { is_expected.to eq(1) }
      end

      context "閏日起点で応当日の前日" do
        let(:from) { time.call(2024, 2, 29) }
        let(:to) { time.call(2024, 3, 28) }

        it { is_expected.to eq(0) }
      end

      context "閏日起点で応当日（起算日が月初のため満了しない）" do
        let(:from) { time.call(2024, 2, 29) }
        let(:to) { time.call(2024, 3, 29) }

        it { is_expected.to eq(0) }
      end

      context "閏日起点で満了日の前日" do
        let(:from) { time.call(2024, 2, 29) }
        let(:to) { time.call(2024, 3, 30) }

        it { is_expected.to eq(0) }
      end

      context "閏日起点で満了日（3月の末日）" do
        let(:from) { time.call(2024, 2, 29) }
        let(:to) { time.call(2024, 3, 31) }

        it { is_expected.to eq(1) }
      end

      context "閏日起点で1年後の前日" do
        let(:from) { time.call(2024, 2, 29) }
        let(:to) { time.call(2025, 2, 27) }

        it { is_expected.to eq(11) }
      end

      context "閏日起点で1年後（平年の2月末日）" do
        let(:from) { time.call(2024, 2, 29) }
        let(:to) { time.call(2025, 2, 28) }

        it { is_expected.to eq(12) }
      end

      context "閏日起点で4年後の閏日" do
        let(:from) { time.call(2024, 2, 29) }
        let(:to) { time.call(2028, 2, 29) }

        it { is_expected.to eq(48) }
      end
    end

    context "年を跨ぐ場合" do
      context "応当日の前日" do
        let(:from) { time.call(2025, 12, 31) }
        let(:to) { time.call(2026, 1, 30) }

        it { is_expected.to eq(0) }
      end

      context "応当日" do
        let(:from) { time.call(2025, 12, 31) }
        let(:to) { time.call(2026, 1, 31) }

        it { is_expected.to eq(1) }
      end
    end

    context "toがfromより前の場合" do
      let(:from) { time.call(2026, 9, 5) }
      let(:to) { time.call(2026, 8, 5) }

      it { expect { subject }.to raise_error(::ArgumentError) }
    end
  end
  # ###################################################################################################################
  # ActiveSupportのメソッドの上書き
  # ###################################################################################################################
  #
  # 2月始まりに設定すると第4四半期は11月〜翌1月となり、暦年基準のActiveSupportとは値が変わる。

  describe "#quarter" do
    context "1月始まりの場合（初期値）" do
      it { expect(time.call(2026,  1, 15, 12, 34, 56).quarter).to eq 1 }
      it { expect(time.call(2026,  3, 15, 12, 34, 56).quarter).to eq 1 }
      it { expect(time.call(2026,  4, 15, 12, 34, 56).quarter).to eq 2 }
      it { expect(time.call(2026,  6, 15, 12, 34, 56).quarter).to eq 2 }
      it { expect(time.call(2026,  7, 15, 12, 34, 56).quarter).to eq 3 }
      it { expect(time.call(2026,  9, 15, 12, 34, 56).quarter).to eq 3 }
      it { expect(time.call(2026, 10, 15, 12, 34, 56).quarter).to eq 4 }
      it { expect(time.call(2026, 12, 15, 12, 34, 56).quarter).to eq 4 }
    end

    context "2月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :february
        end
      end

      it { expect(time.call(2026,  1, 15, 12, 34, 56).quarter).to eq 4 }
      it { expect(time.call(2026,  3, 15, 12, 34, 56).quarter).to eq 1 }
      it { expect(time.call(2026,  4, 15, 12, 34, 56).quarter).to eq 1 }
      it { expect(time.call(2026,  6, 15, 12, 34, 56).quarter).to eq 2 }
      it { expect(time.call(2026,  7, 15, 12, 34, 56).quarter).to eq 2 }
      it { expect(time.call(2026,  9, 15, 12, 34, 56).quarter).to eq 3 }
      it { expect(time.call(2026, 10, 15, 12, 34, 56).quarter).to eq 3 }
      it { expect(time.call(2026, 12, 15, 12, 34, 56).quarter).to eq 4 }
    end
  end

  describe "#beginning_of_quarter" do
    context "2月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :february
        end
      end

      it "ActiveSupportの暦年基準（2026-01-01）ではなく設定を反映した値を返す" do
        expect(time.call(2026, 1, 15, 12, 34, 56).beginning_of_quarter)
          .to eq day_beginning.call(2025, 11, 1)
      end
    end
  end

  describe "#at_beginning_of_quarter" do
    context "2月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :february
        end
      end

      it "ActiveSupportの暦年基準（2026-01-01）ではなく設定を反映した値を返す" do
        expect(time.call(2026, 1, 15, 12, 34, 56).at_beginning_of_quarter)
          .to eq day_beginning.call(2025, 11, 1)
      end
    end
  end

  describe "#end_of_quarter" do
    context "2月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :february
        end
      end

      it "ActiveSupportの暦年基準（2026-03-31）ではなく設定を反映した値を返す" do
        expect(time.call(2026, 1, 15, 12, 34, 56).end_of_quarter)
          .to eq day_end.call(2026, 1, 31)
      end
    end
  end

  describe "#at_end_of_quarter" do
    context "2月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :february
        end
      end

      it "ActiveSupportの暦年基準（2026-03-31）ではなく設定を反映した値を返す" do
        expect(time.call(2026, 1, 15, 12, 34, 56).at_end_of_quarter)
          .to eq day_end.call(2026, 1, 31)
      end
    end
  end

  describe "#all_quarter" do
    context "2月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :february
        end
      end

      it "ActiveSupportの暦年基準（2026-01-01..2026-03-31）ではなく設定を反映した値を返す" do
        expect(time.call(2026, 1, 15, 12, 34, 56).all_quarter)
          .to eq ::Range.new(day_beginning.call(2025, 11, 1), day_end.call(2026, 1, 31))
      end
    end
  end

  describe "#next_quarter" do
    context "2月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :february
        end
      end

      it "ActiveSupportの暦年基準（2026-04-15）ではなく設定を反映した値を返す" do
        expect(time.call(2026, 1, 15, 12, 34, 56).next_quarter)
          .to eq day_beginning.call(2026, 2, 1)
      end
    end
  end

  describe "#prev_quarter" do
    context "2月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :february
        end
      end

      it "ActiveSupportの暦年基準（2025-10-15）ではなく設定を反映した値を返す" do
        expect(time.call(2026, 1, 15, 12, 34, 56).prev_quarter)
          .to eq day_beginning.call(2025, 8, 1)
      end
    end
  end

  describe "#last_quarter" do
    context "2月始まりの場合" do
      before do
        ::Decentworks::DateSupport.configure do |config|
          config.first_quarter_month_name = :february
        end
      end

      it "ActiveSupportの暦年基準（2025-10-15）ではなく設定を反映した値を返す" do
        expect(time.call(2026, 1, 15, 12, 34, 56).last_quarter)
          .to eq day_beginning.call(2025, 8, 1)
      end
    end
  end
end

# frozen_string_literal: true

# 週の始まりの曜日（::Date.beginning_of_week）を切り替えた場合の振る舞い
#
# includeする側で `let(:time)` / `let(:day_beginning)` / `let(:day_end)` を定義すること。
RSpec.shared_examples "週始まり曜日" do
  # 起点の2026-08-05は水曜日
  {
    monday:    [ [ 2026, 8, 3 ], [ 2026, 8, 9 ] ],
    tuesday:   [ [ 2026, 8, 4 ], [ 2026, 8, 10 ] ],
    wednesday: [ [ 2026, 8, 5 ], [ 2026, 8, 11 ] ],
    thursday:  [ [ 2026, 7, 30 ], [ 2026, 8, 5 ] ],
    friday:    [ [ 2026, 7, 31 ], [ 2026, 8, 6 ] ],
    saturday:  [ [ 2026, 8, 1 ], [ 2026, 8, 7 ] ],
    sunday:    [ [ 2026, 8, 2 ], [ 2026, 8, 8 ] ]
  }.each do |week_start, (first_day, last_day)|
    context "週の始まりが#{week_start}の場合" do
      before { ::Date.beginning_of_week = week_start }

      let(:instance) { time.call(2026, 8, 5, 12, 34, 56) }

      describe "#beginning_of_this_week" do
        subject { instance.beginning_of_this_week }

        it { is_expected.to eq day_beginning.call(*first_day) }
      end

      describe "#end_of_this_week" do
        subject { instance.end_of_this_week }

        it { is_expected.to eq day_end.call(*last_day) }
      end

      describe "#all_this_week" do
        subject { instance.all_this_week }

        it { is_expected.to eq ::Range.new(day_beginning.call(*first_day), day_end.call(*last_day)) }
      end
    end
  end
end

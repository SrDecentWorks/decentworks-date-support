# frozen_string_literal: true

require "spec_helper"

RSpec.describe ::DateTime do
  let(:time) do
    ->(year, month, day, hour = 0, min = 0, sec = 0) { ::DateTime.new(year, month, day, hour, min, sec, "+09:00") }
  end
  let(:day_beginning) { ->(year, month, day) { time.call(year, month, day).beginning_of_day } }
  let(:day_end) { ->(year, month, day) { time.call(year, month, day).end_of_day } }

  it_behaves_like "日時拡張"
  it_behaves_like "週始まり曜日"
  it_behaves_like "境界日"
  it_behaves_like "別名メソッドの遅延束縛"
end

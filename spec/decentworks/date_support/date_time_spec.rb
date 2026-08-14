# frozen_string_literal: true

require "spec_helper"

RSpec.describe ::DateTime do
  let(:time) do
    ->(year, month, day, hour = 0, min = 0, sec = 0) { ::DateTime.new(year, month, day, hour, min, sec, "+09:00") }
  end

  it_behaves_like "日時拡張"
end

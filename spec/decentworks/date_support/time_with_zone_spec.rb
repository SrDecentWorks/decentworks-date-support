# frozen_string_literal: true

require "spec_helper"

RSpec.describe ::ActiveSupport::TimeWithZone do
  let(:time) do
    ->(year, month, day, hour = 0, min = 0, sec = 0) { ::Time.zone.local(year, month, day, hour, min, sec) }
  end

  it_behaves_like "日時拡張"
end

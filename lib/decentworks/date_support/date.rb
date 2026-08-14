# frozen_string_literal: true

require "date"
require "active_support"
require "active_support/time"
require_relative "configuration"

class ::Date
  # ###################################################################################################################
  # 満経過月数
  # ###################################################################################################################

  # 満経過月数
  #
  # fromからtoまでに満了した月数を返す。
  # 民法第140条（初日不算入）に従いfromの翌日を起算日とし、
  # 民法第143条第2項に従い応当日の前日をもって満了とする。
  # 応当日が存在しない月は、同項ただし書に従いその月の末日をもって満了とする。
  #
  #   ::Date.whole_months_elapsed(from: ::Date.new(2026, 1, 31), to: ::Date.new(2026, 2, 27)) # => 0
  #   ::Date.whole_months_elapsed(from: ::Date.new(2026, 1, 31), to: ::Date.new(2026, 2, 28)) # => 1
  #   ::Date.whole_months_elapsed(from: ::Date.new(2026, 2, 28), to: ::Date.new(2026, 3, 30)) # => 0
  #   ::Date.whole_months_elapsed(from: ::Date.new(2026, 2, 28), to: ::Date.new(2026, 3, 31)) # => 1
  #   ::Date.whole_months_elapsed(from: ::Date.new(2024, 2, 29), to: ::Date.new(2025, 2, 28)) # => 12
  #
  # @raise [ArgumentError] toがfromより前の日付の場合
  # steep:ignore:start
  def self.whole_months_elapsed(from:, to:)
    raise ::ArgumentError, "to must be on or after from (from: #{from}, to: #{to})" if to < from

    months = ((to.year - from.year) * 12) + (to.month - from.month)

    # 満了日に達していない場合は1ヶ月に満たない
    expiration_date(from:, months:) > to ? months - 1 : months
  end

  # 満了日
  #
  # fromから起算してmonthsヶ月が満了する日を返す。
  #
  #   from: 2026-01-15, months: 1 # => 2026-02-15（起算日2026-01-16の応当日2026-02-16の前日）
  #   from: 2026-01-30, months: 1 # => 2026-02-28（起算日2026-01-31の応当日が存在しないため2月の末日）
  #   from: 2026-02-28, months: 1 # => 2026-03-31（起算日2026-03-01の応当日2026-04-01の前日）
  def self.expiration_date(from:, months:)
    beginning_date = from.next_day                # 起算日（初日不算入）
    corresponding_date = beginning_date >> months # 応当日（存在しない場合はその月の末日に繰り下がる）

    corresponding_date.day == beginning_date.day ? corresponding_date.prev_day : corresponding_date
  end
  private_class_method :expiration_date
  # steep:ignore:end

  # ###################################################################################################################
  # 週関係
  # ###################################################################################################################

  #
  # 今週
  #

  # 現在の日付が属する週の始まりの日付
  def beginning_of_this_week = beginning_of_week(::Date.beginning_of_week) # steep:ignore NoMethod

  # 現在の日付が属する週の終わりの日付
  def end_of_this_week = beginning_of_this_week.advance(days: 6) # steep:ignore NoMethod

  # 今週の期間
  def all_this_week = ::Range.new(beginning_of_this_week, end_of_this_week)

  # ###################################################################################################################
  # 月関係
  # ###################################################################################################################

  #
  # 今月関係
  #

  # 現在の日付が属する月の期間
  def all_this_month = ::Range.new(beginning_of_month, end_of_month) # steep:ignore NoMethod

  #
  # Nヶ月前関係
  #

  # 2ヶ月前の日付
  def two_months_ago = months_ago(2) # steep:ignore NoMethod

  # 3ヶ月前の日付
  def three_months_ago = months_ago(3) # steep:ignore NoMethod

  # 4ヶ月前の日付
  def four_months_ago = months_ago(4) # steep:ignore NoMethod

  # 5ヶ月前の日付
  def five_months_ago = months_ago(5) # steep:ignore NoMethod

  # 6ヶ月前の日付
  def six_months_ago = months_ago(6) # steep:ignore NoMethod

  # 半年前の日付
  def half_year_ago = six_months_ago

  # 7ヶ月前の日付
  def seven_months_ago = months_ago(7) # steep:ignore NoMethod

  # 8ヶ月前の日付
  def eight_months_ago = months_ago(8) # steep:ignore NoMethod

  # 9ヶ月前の日付
  def nine_months_ago = months_ago(9) # steep:ignore NoMethod

  # 10ヶ月前の日付
  def ten_months_ago = months_ago(10) # steep:ignore NoMethod

  # 11ヶ月前の日付
  def eleven_months_ago = months_ago(11) # steep:ignore NoMethod

  #
  # Nヶ月後関係
  #

  # 2ヶ月後の日付
  def two_months_since = months_since(2) # steep:ignore NoMethod

  # 3ヶ月後の日付
  def three_months_since = months_since(3) # steep:ignore NoMethod

  # 4ヶ月後の日付
  def four_months_since = months_since(4) # steep:ignore NoMethod

  # 5ヶ月後の日付
  def five_months_since = months_since(5) # steep:ignore NoMethod

  # 6ヶ月後の日付
  def six_months_since = months_since(6) # steep:ignore NoMethod

  # 半年後の日付
  def half_year_since = six_months_since

  # 7ヶ月後の日付
  def seven_months_since = months_since(7) # steep:ignore NoMethod

  # 8ヶ月後の日付
  def eight_months_since = months_since(8) # steep:ignore NoMethod

  # 9ヶ月後の日付
  def nine_months_since = months_since(9) # steep:ignore NoMethod

  # 10ヶ月後の日付
  def ten_months_since = months_since(10) # steep:ignore NoMethod

  # 11ヶ月後の日付
  def eleven_months_since = months_since(11) # steep:ignore NoMethod

  #
  # 暦月関係
  #

  #
  # 1月
  #

  # 1月の月初
  def beginning_of_january = change(month: 1, day: 1) # steep:ignore NoMethod

  # 1月の月末
  def end_of_january = beginning_of_january.end_of_month

  # 1月の期間
  def all_january = ::Range.new(beginning_of_january, end_of_january)

  # 1月の月初か？
  def beginning_of_january? = self == beginning_of_january

  # 1月の月末か？
  def end_of_january? = self == end_of_january

  # 1月か？
  def in_january? = all_january.cover?(self)

  #
  # 2月
  #

  # 2月の月初
  def beginning_of_february = change(month: 2, day: 1) # steep:ignore NoMethod

  # 2月の月末
  def end_of_february = beginning_of_february.end_of_month

  # 2月の期間
  def all_february = ::Range.new(beginning_of_february, end_of_february)

  # 2月の月初か？
  def beginning_of_february? = self == beginning_of_february

  # 2月の月末か？
  def end_of_february? = self == end_of_february

  # 2月か？
  def in_february? = all_february.cover?(self)

  #
  # 3月
  #

  # 3月の月初
  def beginning_of_march = change(month: 3, day: 1) # steep:ignore NoMethod

  # 3月の月末
  def end_of_march = beginning_of_march.end_of_month

  # 3月の期間
  def all_march = ::Range.new(beginning_of_march, end_of_march)

  # 3月の月初か？
  def beginning_of_march? = self == beginning_of_march

  # 3月の月末か？
  def end_of_march? = self == end_of_march

  # 3月か？
  def in_march? = all_march.cover?(self)

  #
  # 4月
  #

  # 4月の月初
  def beginning_of_april = change(month: 4, day: 1) # steep:ignore NoMethod

  # 4月の月末
  def end_of_april = beginning_of_april.end_of_month

  # 4月の期間
  def all_april = ::Range.new(beginning_of_april, end_of_april)

  # 4月の月初か？
  def beginning_of_april? = self == beginning_of_april

  # 4月の月末か？
  def end_of_april? = self == end_of_april

  # 4月か？
  def in_april? = all_april.cover?(self)

  #
  # 5月
  #

  # 5月の月初
  def beginning_of_may = change(month: 5, day: 1) # steep:ignore NoMethod

  # 5月の月末
  def end_of_may = beginning_of_may.end_of_month

  # 5月の期間
  def all_may = ::Range.new(beginning_of_may, end_of_may)

  # 5月の月初か？
  def beginning_of_may? = self == beginning_of_may

  # 5月の月末か？
  def end_of_may? = self == end_of_may

  # 5月か？
  def in_may? = all_may.cover?(self)

  #
  # 6月
  #

  # 6月の月初
  def beginning_of_june = change(month: 6, day: 1) # steep:ignore NoMethod

  # 6月の月末
  def end_of_june = beginning_of_june.end_of_month

  # 6月の期間
  def all_june = ::Range.new(beginning_of_june, end_of_june)

  # 6月の月初か？
  def beginning_of_june? = self == beginning_of_june

  # 6月の月末か？
  def end_of_june? = self == end_of_june

  # 6月か？
  def in_june? = all_june.cover?(self)

  #
  # 7月
  #

  # 7月の月初
  def beginning_of_july = change(month: 7, day: 1) # steep:ignore NoMethod

  # 7月の月末
  def end_of_july = beginning_of_july.end_of_month

  # 7月の期間
  def all_july = ::Range.new(beginning_of_july, end_of_july)

  # 7月の月初か？
  def beginning_of_july? = self == beginning_of_july

  # 7月の月末か？
  def end_of_july? = self == end_of_july

  # 7月か？
  def in_july? = all_july.cover?(self)

  #
  # 8月
  #

  # 8月の月初
  def beginning_of_august = change(month: 8, day: 1) # steep:ignore NoMethod

  # 8月の月末
  def end_of_august = beginning_of_august.end_of_month

  # 8月の期間
  def all_august = ::Range.new(beginning_of_august, end_of_august)

  # 8月の月初か？
  def beginning_of_august? = self == beginning_of_august

  # 8月の月末か？
  def end_of_august? = self == end_of_august

  # 8月か？
  def in_august? = all_august.cover?(self)

  #
  # 9月
  #

  # 9月の月初
  def beginning_of_september = change(month: 9, day: 1) # steep:ignore NoMethod

  # 9月の月末
  def end_of_september = beginning_of_september.end_of_month

  # 9月の期間
  def all_september = ::Range.new(beginning_of_september, end_of_september)

  # 9月の月初か？
  def beginning_of_september? = self == beginning_of_september

  # 9月の月末か？
  def end_of_september? = self == end_of_september

  # 9月か？
  def in_september? = all_september.cover?(self)

  #
  # 10月
  #

  # 10月の月初
  def beginning_of_october = change(month: 10, day: 1) # steep:ignore NoMethod

  # 10月の月末
  def end_of_october = beginning_of_october.end_of_month

  # 10月の期間
  def all_october = ::Range.new(beginning_of_october, end_of_october)

  # 10月の月初か？
  def beginning_of_october? = self == beginning_of_october

  # 10月の月末か？
  def end_of_october? = self == end_of_october

  # 10月か？
  def in_october? = all_october.cover?(self)

  #
  # 11月
  #

  # 11月の月初
  def beginning_of_november = change(month: 11, day: 1) # steep:ignore NoMethod

  # 11月の月末
  def end_of_november = beginning_of_november.end_of_month

  # 11月の期間
  def all_november = ::Range.new(beginning_of_november, end_of_november)

  # 11月の月初か？
  def beginning_of_november? = self == beginning_of_november

  # 11月の月末か？
  def end_of_november? = self == end_of_november

  # 11月か？
  def in_november? = all_november.cover?(self)

  #
  # 12月
  #

  # 12月の月初
  def beginning_of_december = change(month: 12, day: 1) # steep:ignore NoMethod

  # 12月の月末
  def end_of_december = beginning_of_december.end_of_month

  # 12月の期間
  def all_december = ::Range.new(beginning_of_december, end_of_december)

  # 12月の月初か？
  def beginning_of_december? = self == beginning_of_december

  # 12月の月末か？
  def end_of_december? = self == end_of_december

  # 12月か？
  def in_december? = all_december.cover?(self)

  # ###################################################################################################################
  # 四半期関係
  # ###################################################################################################################

  #
  # 第1四半期
  #

  # 第1四半期の期首
  def beginning_of_first_quarter
    beginning_of_month
      .months_ago(::Decentworks::DateSupport.first_quarter_month_offset) # 1月始まりと見た時の対応した日付に移動
      .change(month: ::Decentworks::DateSupport.beginning_of_first_quarter_month, day: 1)
  end

  # 第1四半期の期末
  def end_of_first_quarter = beginning_of_first_quarter.two_months_since.end_of_month

  # 第1四半期の期間
  def all_first_quarter = ::Range.new(beginning_of_first_quarter, end_of_first_quarter)

  # 第1四半期の期首か？
  def beginning_of_first_quarter? = self == beginning_of_first_quarter

  # 第1四半期の期末か？
  def end_of_first_quarter? = self == end_of_first_quarter

  # 第1四半期か？
  def in_first_quarter? = all_first_quarter.cover?(self)

  #
  # 第2四半期
  #

  # 第2四半期の期首
  def beginning_of_second_quarter = beginning_of_first_quarter.three_months_since

  # 第2四半期の期末
  def end_of_second_quarter = beginning_of_second_quarter.two_months_since.end_of_month

  # 第2四半期の期間
  def all_second_quarter = ::Range.new(beginning_of_second_quarter, end_of_second_quarter)

  # 第2四半期の期首か？
  def beginning_of_second_quarter? = self == beginning_of_second_quarter

  # 第2四半期の期末か？
  def end_of_second_quarter? = self == end_of_second_quarter

  # 第2四半期か？
  def in_second_quarter? = all_second_quarter.cover?(self)

  #
  # 第3四半期
  #

  # 第3四半期の期首
  def beginning_of_third_quarter = beginning_of_first_quarter.six_months_since

  # 第3四半期の期末
  def end_of_third_quarter = beginning_of_third_quarter.two_months_since.end_of_month

  # 第3四半期の期間
  def all_third_quarter = ::Range.new(beginning_of_third_quarter, end_of_third_quarter)

  # 第3四半期の期首か？
  def beginning_of_third_quarter? = self == beginning_of_third_quarter

  # 第3四半期の期末か？
  def end_of_third_quarter? = self == end_of_third_quarter

  # 第3四半期か？
  def in_third_quarter? = all_third_quarter.cover?(self)

  #
  # 第4四半期
  #

  # 第4四半期の期首
  def beginning_of_fourth_quarter = beginning_of_first_quarter.nine_months_since

  # 第4四半期の期末
  def end_of_fourth_quarter = beginning_of_fourth_quarter.two_months_since.end_of_month

  # 第4四半期の期間
  def all_fourth_quarter = ::Range.new(beginning_of_fourth_quarter, end_of_fourth_quarter)

  # 第4四半期の期首か？
  def beginning_of_fourth_quarter? = self == beginning_of_fourth_quarter

  # 第4四半期の期末か？
  def end_of_fourth_quarter? = self == end_of_fourth_quarter

  # 第4四半期か？
  def in_fourth_quarter? = all_fourth_quarter.cover?(self)

  # ###################################################################################################################
  # 上下期関係
  # ###################################################################################################################

  #
  # 上期
  #

  # 上期の期首
  def beginning_of_first_half = beginning_of_first_quarter

  # 上期の期末
  def end_of_first_half = end_of_second_quarter

  # 上期の期間
  def all_first_half = ::Range.new(beginning_of_first_half, end_of_first_half)

  # 上期の期首か？
  def beginning_of_first_half? = self == beginning_of_first_half

  # 上期の期末か？
  def end_of_first_half? = self == end_of_first_half

  # 上期か？
  def in_first_half? = all_first_half.cover?(self)

  #
  # 下期
  #

  # 下期の期首
  def beginning_of_second_half = beginning_of_third_quarter

  # 下期の期末
  def end_of_second_half = end_of_fourth_quarter

  # 下期の期間
  def all_second_half = ::Range.new(beginning_of_second_half, end_of_second_half)

  # 下期の期首か？
  def beginning_of_second_half? = self == beginning_of_second_half

  # 下期の期末か？
  def end_of_second_half? = self == end_of_second_half

  # 下期か？
  def in_second_half? = all_second_half.cover?(self)
end

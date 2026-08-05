# frozen_string_literal: true

require "date"
require "decentworks/date_support"

module Decentworks
  module ActiveSupport
    module TimeWithZoneSupport
      using ::Decentworks::DateSupport

      refine ::ActiveSupport::TimeWithZone do
        # #############################################################################################################
        # 週関係
        # #############################################################################################################

        #
        # 今週
        #

        # 現在の日付が属する週の始まりの日付
        #
        # @param beginning_of_week 週の始まりの曜日。省略した場合は、config.beginning_of_weekの設定に従います。
        def beginning_of_this_week(beginning_of_week = nil)
          to_date # steep:ignore NoMethod
            .beginning_of_this_week(beginning_of_week)
            .beginning_of_day
        end

        # 現在の日付が属する週の終わりの日付
        #
        # @param beginning_of_week 週の始まりの曜日。省略した場合は、config.beginning_of_weekの設定に従います。
        def end_of_this_week(beginning_of_week = nil)
          to_date # steep:ignore NoMethod
            .next_week
            .beginning_of_this_week(beginning_of_week)
            .yesterday
            .end_of_day
        end

        # 今週の期間
        #
        # @param beginning_of_week 週の始まりの曜日。省略した場合は、config.beginning_of_weekの設定に従います。
        def all_this_week(beginning_of_week = nil)
          ::Range.new(
            beginning_of_this_week(beginning_of_week),
            end_of_this_week(beginning_of_week)
          )
        end

        # #############################################################################################################
        # 月関係
        # #############################################################################################################

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

        # 半年前の日
        alias_method :half_year_ago, :six_months_ago

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

        # 半年前の日
        alias_method :half_year_since, :six_months_since

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

        # 1月の月初
        def beginning_of_january = to_date.beginning_of_january.beginning_of_day # steep:ignore NoMethod

        # 1月の月末
        def end_of_january = beginning_of_january.end_of_month.end_of_day

        # 1月の期間
        def all_january = ::Range.new(beginning_of_january, end_of_january)

        # 2月の月初
        def beginning_of_february = to_date.beginning_of_february.beginning_of_day # steep:ignore NoMethod

        # 2月の月末
        def end_of_february = beginning_of_february.end_of_month.end_of_day

        # 2月の期間
        def all_february = ::Range.new(beginning_of_february, end_of_february)

        # 3月の月初
        def beginning_of_march = to_date.beginning_of_march.beginning_of_day # steep:ignore NoMethod

        # 3月の月末
        def end_of_march = beginning_of_march.end_of_month.end_of_day

        # 3月の期間
        def all_march = ::Range.new(beginning_of_march, end_of_march)

        # 4月の月初
        def beginning_of_april = to_date.beginning_of_april.beginning_of_day # steep:ignore NoMethod

        # 4月の月末
        def end_of_april = beginning_of_april.end_of_month.end_of_day

        # 4月の期間
        def all_april = ::Range.new(beginning_of_april, end_of_april)

        # 5月の月初
        def beginning_of_may = to_date.beginning_of_may.beginning_of_day # steep:ignore NoMethod

        # 5月の月末
        def end_of_may = beginning_of_may.end_of_month.end_of_day

        # 5月の期間
        def all_may = ::Range.new(beginning_of_may, end_of_may)

        # 6月の月初
        def beginning_of_june = to_date.beginning_of_june.beginning_of_day # steep:ignore NoMethod

        # 6月の月末
        def end_of_june = beginning_of_june.end_of_month.end_of_day

        # 6月の期間
        def all_june = ::Range.new(beginning_of_june, end_of_june)

        # 7月の月初
        def beginning_of_july = to_date.beginning_of_july.beginning_of_day # steep:ignore NoMethod

        # 7月の月末
        def end_of_july = beginning_of_july.end_of_month.end_of_day

        # 7月の期間
        def all_july = ::Range.new(beginning_of_july, end_of_july)

        # 8月の月初
        def beginning_of_august = to_date.beginning_of_august.beginning_of_day # steep:ignore NoMethod

        # 8月の月末
        def end_of_august = beginning_of_august.end_of_month.end_of_day

        # 8月の期間
        def all_august = ::Range.new(beginning_of_august, end_of_august)

        # 9月の月初
        def beginning_of_september = to_date.beginning_of_september.beginning_of_day # steep:ignore NoMethod

        # 9月の月末
        def end_of_september = beginning_of_september.end_of_month.end_of_day

        # 9月の期間
        def all_september = ::Range.new(beginning_of_september, end_of_september)

        # 10月の月初
        def beginning_of_october = to_date.beginning_of_october.beginning_of_day # steep:ignore NoMethod

        # 10月の月末
        def end_of_october = beginning_of_october.end_of_month.end_of_day

        # 10月の期間
        def all_october = ::Range.new(beginning_of_october, end_of_october)

        # 11月の月初
        def beginning_of_november = to_date.beginning_of_november.beginning_of_day # steep:ignore NoMethod

        # 11月の月末
        def end_of_november = beginning_of_november.end_of_month.end_of_day

        # 11月の期間
        def all_november = ::Range.new(beginning_of_november, end_of_november)

        # 12月の月初
        def beginning_of_december = to_date.beginning_of_december.beginning_of_day # steep:ignore NoMethod

        # 12月の月末
        def end_of_december = beginning_of_december.end_of_month.end_of_day

        # 12月の期間
        def all_december = ::Range.new(beginning_of_december, end_of_december)

        # #############################################################################################################
        # 四半期関係
        # #############################################################################################################

        # 第1四半期の始めの日付
        alias_method :beginning_of_first_quarter, :beginning_of_january

        # 第1四半期の終わりの日付
        alias_method :end_of_first_quarter, :end_of_march

        # 第1四半期の期間
        def all_first_quarter = ::Range.new(beginning_of_first_quarter, end_of_first_quarter)

        # 第2四半期の始めの日付
        alias_method :beginning_of_second_quarter, :beginning_of_april

        # 第2四半期の終わりの日付
        alias_method :end_of_second_quarter, :end_of_june

        # 第2四半期の期間
        def all_second_quarter = ::Range.new(beginning_of_second_quarter, end_of_second_quarter)

        # 第3四半期の始めの日付
        alias_method :beginning_of_third_quarter, :beginning_of_july

        # 第3四半期の終わりの日付
        alias_method :end_of_third_quarter, :end_of_september

        # 第3四半期の期間
        def all_third_quarter = ::Range.new(beginning_of_third_quarter, end_of_third_quarter)

        # 第4四半期の始めの日付
        alias_method :beginning_of_fourth_quarter, :beginning_of_october

        # 第4四半期の終わりの日付
        alias_method :end_of_fourth_quarter, :end_of_december

        # 第4四半期の期間
        def all_fourth_quarter = ::Range.new(beginning_of_fourth_quarter, end_of_fourth_quarter)

        # #############################################################################################################
        # 上下期関係
        # #############################################################################################################

        # 上期の始まりの日付
        alias_method :beginning_of_first_half, :beginning_of_first_quarter

        # 上期の終わりの日付
        alias_method :end_of_first_half, :end_of_second_quarter

        # 上期の期間
        def all_first_half = ::Range.new(beginning_of_first_half, end_of_first_half)

        # 下期の始まりの日付
        alias_method :beginning_of_second_half, :beginning_of_third_quarter

        # 下期の終わりの日付
        alias_method :end_of_second_half, :end_of_fourth_quarter

        # 下期の期間
        def all_second_half = ::Range.new(beginning_of_second_half, end_of_second_half)
      end

      refine ::ActiveSupport::TimeWithZone.singleton_class do
        # #############################################################################################################
        # 満経過月数
        # #############################################################################################################

        # 満経過月数
        # steep:ignore:start
        def whole_months_elapsed(from:, to:)
          ::Date.whole_months_elapsed(
            from: from.to_date,
            to: to.to_date
          )
        end
        # steep:ignore:end
      end
    end
  end
end

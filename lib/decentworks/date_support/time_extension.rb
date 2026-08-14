# frozen_string_literal: true

require "date"                # ::Date
require "active_support"
require "active_support/time" # レシーバに対する change / months_ago / all_day などの拡張

require_relative "date" # ::Date.whole_months_elapsed を利用するため
require_relative "configuration" # ::Decentworks::DateSupport.first_quarter_month_offset を利用するため

module Decentworks
  module DateSupport
    # ::Time / ::DateTime / ::ActiveSupport::TimeWithZone に共通の日時拡張
    #
    # 各メソッドはレシーバと同じクラスの値を返す。
    #
    # sigでは戻り値を self（::Range[self]）と宣言しているが、Steepはモジュール内部での
    # レシーバ省略呼び出しの型をモジュール自身（TimeExtension）として解決するため、
    # selfを返すメソッドをそのまま返すだけのメソッドが MethodBodyTypeMismatch になる。
    # 該当箇所には # steep:ignore MethodBodyTypeMismatch を付けている。
    module TimeExtension
      # includeしたクラスにクラスメソッドを追加する
      def self.included(base) = base.extend(ClassMethods)

      module ClassMethods
        # #############################################################################################################
        # 満経過月数
        # #############################################################################################################

        # 満経過月数
        #
        # fromからtoまでに満了した月数を返す。日付単位で判定し、時刻は考慮しない。
        # 応当日が存在しない月は、民法第143条第2項に準じてその月の末日を応当日とみなす。
        #
        # @raise [ArgumentError] toの日付がfromの日付より前の場合
        def whole_months_elapsed(from:, to:)
          ::Date.whole_months_elapsed(
            from: from.to_date,
            to:   to.to_date
          )
        end
      end

      # ###############################################################################################################
      # 週関係
      # ###############################################################################################################

      #
      # 今週
      #

      # 現在の日付が属する週の始まりの日付
      def beginning_of_this_week = beginning_of_week(::Date.beginning_of_week).beginning_of_day

      # 現在の日付が属する週の終わりの日付
      def end_of_this_week = beginning_of_this_week.advance(days: 6).end_of_day

      # 今週の期間
      def all_this_week = ::Range.new(beginning_of_this_week, end_of_this_week) # steep:ignore MethodBodyTypeMismatch

      # ###############################################################################################################
      # 月関係
      # ###############################################################################################################

      #
      # 今月関係
      #

      # 現在の日付が属する月の期間
      def all_this_month = ::Range.new(beginning_of_month, end_of_month)

      #
      # Nヶ月前関係
      #

      # 2ヶ月前の日付
      def two_months_ago = months_ago(2)

      # 3ヶ月前の日付
      def three_months_ago = months_ago(3)

      # 4ヶ月前の日付
      def four_months_ago = months_ago(4)

      # 5ヶ月前の日付
      def five_months_ago = months_ago(5)

      # 6ヶ月前の日付
      def six_months_ago = months_ago(6)

      # 半年前の日付
      def half_year_ago = six_months_ago # steep:ignore MethodBodyTypeMismatch

      # 7ヶ月前の日付
      def seven_months_ago = months_ago(7)

      # 8ヶ月前の日付
      def eight_months_ago = months_ago(8)

      # 9ヶ月前の日付
      def nine_months_ago = months_ago(9)

      # 10ヶ月前の日付
      def ten_months_ago = months_ago(10)

      # 11ヶ月前の日付
      def eleven_months_ago = months_ago(11)

      #
      # Nヶ月後関係
      #

      # 2ヶ月後の日付
      def two_months_since = months_since(2)

      # 3ヶ月後の日付
      def three_months_since = months_since(3)

      # 4ヶ月後の日付
      def four_months_since = months_since(4)

      # 5ヶ月後の日付
      def five_months_since = months_since(5)

      # 6ヶ月後の日付
      def six_months_since = months_since(6)

      # 半年後の日付
      def half_year_since = six_months_since # steep:ignore MethodBodyTypeMismatch

      # 7ヶ月後の日付
      def seven_months_since = months_since(7)

      # 8ヶ月後の日付
      def eight_months_since = months_since(8)

      # 9ヶ月後の日付
      def nine_months_since = months_since(9)

      # 10ヶ月後の日付
      def ten_months_since = months_since(10)

      # 11ヶ月後の日付
      def eleven_months_since = months_since(11)

      #
      # 暦月関係
      #

      #
      # 1月
      #

      # 1月の月初
      def beginning_of_january = change(month: 1, day: 1).beginning_of_day

      # 1月の月末
      def end_of_january = beginning_of_january.end_of_month.end_of_day

      # 1月の期間
      def all_january = ::Range.new(beginning_of_january, end_of_january) # steep:ignore MethodBodyTypeMismatch

      # 1月の月初か？
      def beginning_of_january? = beginning_of_january.all_day.cover?(self)

      # 1月の月末か？
      def end_of_january? = end_of_january.all_day.cover?(self)

      # 1月か？
      def in_january? = all_january.cover?(self)

      #
      # 2月
      #

      # 2月の月初
      def beginning_of_february = change(month: 2, day: 1).beginning_of_day

      # 2月の月末
      def end_of_february = beginning_of_february.end_of_month.end_of_day

      # 2月の期間
      def all_february = ::Range.new(beginning_of_february, end_of_february) # steep:ignore MethodBodyTypeMismatch

      # 2月の月初か？
      def beginning_of_february? = beginning_of_february.all_day.cover?(self)

      # 2月の月末か？
      def end_of_february? = end_of_february.all_day.cover?(self)

      # 2月か？
      def in_february? = all_february.cover?(self)

      #
      # 3月
      #

      # 3月の月初
      def beginning_of_march = change(month: 3, day: 1).beginning_of_day

      # 3月の月末
      def end_of_march = beginning_of_march.end_of_month.end_of_day

      # 3月の期間
      def all_march = ::Range.new(beginning_of_march, end_of_march) # steep:ignore MethodBodyTypeMismatch

      # 3月の月初か？
      def beginning_of_march? = beginning_of_march.all_day.cover?(self)

      # 3月の月末か？
      def end_of_march? = end_of_march.all_day.cover?(self)

      # 3月か？
      def in_march? = all_march.cover?(self)

      #
      # 4月
      #

      # 4月の月初
      def beginning_of_april = change(month: 4, day: 1).beginning_of_day

      # 4月の月末
      def end_of_april = beginning_of_april.end_of_month.end_of_day

      # 4月の期間
      def all_april = ::Range.new(beginning_of_april, end_of_april) # steep:ignore MethodBodyTypeMismatch

      # 4月の月初か？
      def beginning_of_april? = beginning_of_april.all_day.cover?(self)

      # 4月の月末か？
      def end_of_april? = end_of_april.all_day.cover?(self)

      # 4月か？
      def in_april? = all_april.cover?(self)

      #
      # 5月
      #

      # 5月の月初
      def beginning_of_may = change(month: 5, day: 1).beginning_of_day

      # 5月の月末
      def end_of_may = beginning_of_may.end_of_month.end_of_day

      # 5月の期間
      def all_may = ::Range.new(beginning_of_may, end_of_may) # steep:ignore MethodBodyTypeMismatch

      # 5月の月初か？
      def beginning_of_may? = beginning_of_may.all_day.cover?(self)

      # 5月の月末か？
      def end_of_may? = end_of_may.all_day.cover?(self)

      # 5月か？
      def in_may? = all_may.cover?(self)

      #
      # 6月
      #

      # 6月の月初
      def beginning_of_june = change(month: 6, day: 1).beginning_of_day

      # 6月の月末
      def end_of_june = beginning_of_june.end_of_month.end_of_day

      # 6月の期間
      def all_june = ::Range.new(beginning_of_june, end_of_june) # steep:ignore MethodBodyTypeMismatch

      # 6月の月初か？
      def beginning_of_june? = beginning_of_june.all_day.cover?(self)

      # 6月の月末か？
      def end_of_june? = end_of_june.all_day.cover?(self)

      # 6月か？
      def in_june? = all_june.cover?(self)

      #
      # 7月
      #

      # 7月の月初
      def beginning_of_july = change(month: 7, day: 1).beginning_of_day

      # 7月の月末
      def end_of_july = beginning_of_july.end_of_month.end_of_day

      # 7月の期間
      def all_july = ::Range.new(beginning_of_july, end_of_july) # steep:ignore MethodBodyTypeMismatch

      # 7月の月初か？
      def beginning_of_july? = beginning_of_july.all_day.cover?(self)

      # 7月の月末か？
      def end_of_july? = end_of_july.all_day.cover?(self)

      # 7月か？
      def in_july? = all_july.cover?(self)

      #
      # 8月
      #

      # 8月の月初
      def beginning_of_august = change(month: 8, day: 1).beginning_of_day

      # 8月の月末
      def end_of_august = beginning_of_august.end_of_month.end_of_day

      # 8月の期間
      def all_august = ::Range.new(beginning_of_august, end_of_august) # steep:ignore MethodBodyTypeMismatch

      # 8月の月初か？
      def beginning_of_august? = beginning_of_august.all_day.cover?(self)

      # 8月の月末か？
      def end_of_august? = end_of_august.all_day.cover?(self)

      # 8月か？
      def in_august? = all_august.cover?(self)

      #
      # 9月
      #

      # 9月の月初
      def beginning_of_september = change(month: 9, day: 1).beginning_of_day

      # 9月の月末
      def end_of_september = beginning_of_september.end_of_month.end_of_day

      # 9月の期間
      def all_september = ::Range.new(beginning_of_september, end_of_september) # steep:ignore MethodBodyTypeMismatch

      # 9月の月初か？
      def beginning_of_september? = beginning_of_september.all_day.cover?(self)

      # 9月の月末か？
      def end_of_september? = end_of_september.all_day.cover?(self)

      # 9月か？
      def in_september? = all_september.cover?(self)

      #
      # 10月
      #

      # 10月の月初
      def beginning_of_october = change(month: 10, day: 1).beginning_of_day

      # 10月の月末
      def end_of_october = beginning_of_october.end_of_month.end_of_day

      # 10月の期間
      def all_october = ::Range.new(beginning_of_october, end_of_october) # steep:ignore MethodBodyTypeMismatch

      # 10月の月初か？
      def beginning_of_october? = beginning_of_october.all_day.cover?(self)

      # 10月の月末か？
      def end_of_october? = end_of_october.all_day.cover?(self)

      # 10月か？
      def in_october? = all_october.cover?(self)

      #
      # 11月
      #

      # 11月の月初
      def beginning_of_november = change(month: 11, day: 1).beginning_of_day

      # 11月の月末
      def end_of_november = beginning_of_november.end_of_month.end_of_day

      # 11月の期間
      def all_november = ::Range.new(beginning_of_november, end_of_november) # steep:ignore MethodBodyTypeMismatch

      # 11月の月初か？
      def beginning_of_november? = beginning_of_november.all_day.cover?(self)

      # 11月の月末か？
      def end_of_november? = end_of_november.all_day.cover?(self)

      # 11月か？
      def in_november? = all_november.cover?(self)

      #
      # 12月
      #

      # 12月の月初
      def beginning_of_december = change(month: 12, day: 1).beginning_of_day

      # 12月の月末
      def end_of_december = beginning_of_december.end_of_month.end_of_day

      # 12月の期間
      def all_december = ::Range.new(beginning_of_december, end_of_december) # steep:ignore MethodBodyTypeMismatch

      # 12月の月初か？
      def beginning_of_december? = beginning_of_december.all_day.cover?(self)

      # 12月の月末か？
      def end_of_december? = end_of_december.all_day.cover?(self)

      # 12月か？
      def in_december? = all_december.cover?(self)

      # ###############################################################################################################
      # 四半期関係
      # ###############################################################################################################

      #
      # 今四半期
      #

      # 現在の日付が属する四半期の番号（1〜4）
      def this_quarter_number
        (((month - ::Decentworks::DateSupport.first_quarter_month) % 12) / 3) + 1
      end

      # 現在の日付が属する四半期の期首
      def beginning_of_this_quarter
        beginning_of_first_quarter.months_since((this_quarter_number - 1) * 3).beginning_of_day
      end

      # 現在の日付が属する四半期の期末
      def end_of_this_quarter = beginning_of_this_quarter.two_months_since.end_of_month.end_of_day

      # 現在の日付が属する四半期の期間
      def all_this_quarter # steep:ignore MethodBodyTypeMismatch
        ::Range.new(beginning_of_this_quarter, end_of_this_quarter)
      end

      #
      # 第1四半期
      #

      # 第1四半期の期首
      def beginning_of_first_quarter
        # 1月始まりと見た時の対応した日付に移動してから開始月に合わせる
        beginning_of_month
          .months_ago(::Decentworks::DateSupport.first_quarter_month_offset)
          .change(month: ::Decentworks::DateSupport.first_quarter_month, day: 1)
          .beginning_of_day
      end

      # 第1四半期の期末
      def end_of_first_quarter = beginning_of_first_quarter.two_months_since.end_of_month.end_of_day

      # 第1四半期の期間
      def all_first_quarter # steep:ignore MethodBodyTypeMismatch
        ::Range.new(beginning_of_first_quarter, end_of_first_quarter)
      end

      # 第1四半期の期首か？
      def beginning_of_first_quarter? = beginning_of_first_quarter.all_day.cover?(self)

      # 第1四半期の期末か？
      def end_of_first_quarter? = end_of_first_quarter.all_day.cover?(self)

      # 第1四半期か？
      def in_first_quarter? = all_first_quarter.cover?(self)

      #
      # 第2四半期
      #

      # 第2四半期の期首
      def beginning_of_second_quarter = beginning_of_first_quarter.three_months_since.beginning_of_day

      # 第2四半期の期末
      def end_of_second_quarter = beginning_of_second_quarter.two_months_since.end_of_month.end_of_day

      # 第2四半期の期間
      def all_second_quarter # steep:ignore MethodBodyTypeMismatch
        ::Range.new(beginning_of_second_quarter, end_of_second_quarter)
      end

      # 第2四半期の期首か？
      def beginning_of_second_quarter? = beginning_of_second_quarter.all_day.cover?(self)

      # 第2四半期の期末か？
      def end_of_second_quarter? = end_of_second_quarter.all_day.cover?(self)

      # 第2四半期か？
      def in_second_quarter? = all_second_quarter.cover?(self)

      #
      # 第3四半期
      #

      # 第3四半期の期首
      def beginning_of_third_quarter = beginning_of_first_quarter.six_months_since.beginning_of_day

      # 第3四半期の期末
      def end_of_third_quarter = beginning_of_third_quarter.two_months_since.end_of_month.end_of_day

      # 第3四半期の期間
      def all_third_quarter # steep:ignore MethodBodyTypeMismatch
        ::Range.new(beginning_of_third_quarter, end_of_third_quarter)
      end

      # 第3四半期の期首か？
      def beginning_of_third_quarter? = beginning_of_third_quarter.all_day.cover?(self)

      # 第3四半期の期末か？
      def end_of_third_quarter? = end_of_third_quarter.all_day.cover?(self)

      # 第3四半期か？
      def in_third_quarter? = all_third_quarter.cover?(self)

      #
      # 第4四半期
      #

      # 第4四半期の期首
      def beginning_of_fourth_quarter = beginning_of_first_quarter.nine_months_since.beginning_of_day

      # 第4四半期の期末
      def end_of_fourth_quarter = beginning_of_fourth_quarter.two_months_since.end_of_month.end_of_day

      # 第4四半期の期間
      def all_fourth_quarter # steep:ignore MethodBodyTypeMismatch
        ::Range.new(beginning_of_fourth_quarter, end_of_fourth_quarter)
      end

      # 第4四半期の期首か？
      def beginning_of_fourth_quarter? = beginning_of_fourth_quarter.all_day.cover?(self)

      # 第4四半期の期末か？
      def end_of_fourth_quarter? = end_of_fourth_quarter.all_day.cover?(self)

      # 第4四半期か？
      def in_fourth_quarter? = all_fourth_quarter.cover?(self)

      # ###############################################################################################################
      # 上下期関係
      # ###############################################################################################################

      #
      # 今期
      #

      # 現在の日付が属する期の番号（1〜2）
      def this_half_number = this_quarter_number <= 2 ? 1 : 2

      # 現在の日付が属する期の期首
      def beginning_of_this_half # steep:ignore MethodBodyTypeMismatch
        this_half_number == 1 ? beginning_of_first_half : beginning_of_second_half
      end

      # 現在の日付が属する期の期末
      def end_of_this_half # steep:ignore MethodBodyTypeMismatch
        this_half_number == 1 ? end_of_first_half : end_of_second_half
      end

      # 現在の日付が属する期の期間
      def all_this_half = ::Range.new(beginning_of_this_half, end_of_this_half) # steep:ignore MethodBodyTypeMismatch

      #
      # 上期
      #

      # 上期の期首
      def beginning_of_first_half = beginning_of_first_quarter # steep:ignore MethodBodyTypeMismatch

      # 上期の期末
      def end_of_first_half = end_of_second_quarter # steep:ignore MethodBodyTypeMismatch

      # 上期の期間
      def all_first_half = ::Range.new(beginning_of_first_half, end_of_first_half) # steep:ignore MethodBodyTypeMismatch

      # 上期の期首か？
      def beginning_of_first_half? = beginning_of_first_half.all_day.cover?(self)

      # 上期の期末か？
      def end_of_first_half? = end_of_first_half.all_day.cover?(self)

      # 上期か？
      def in_first_half? = all_first_half.cover?(self)

      #
      # 下期
      #

      # 下期の期首
      def beginning_of_second_half = beginning_of_third_quarter # steep:ignore MethodBodyTypeMismatch

      # 下期の期末
      def end_of_second_half = end_of_fourth_quarter # steep:ignore MethodBodyTypeMismatch

      # 下期の期間
      def all_second_half # steep:ignore MethodBodyTypeMismatch
        ::Range.new(beginning_of_second_half, end_of_second_half)
      end

      # 下期の期首か？
      def beginning_of_second_half? = beginning_of_second_half.all_day.cover?(self)

      # 下期の期末か？
      def end_of_second_half? = end_of_second_half.all_day.cover?(self)

      # 下期か？
      def in_second_half? = all_second_half.cover?(self)

      # ###############################################################################################################
      # 年度関係
      # ###############################################################################################################

      # 現在の日付が属する年度（期首の年）
      def fiscal_year = beginning_of_fiscal_year.year

      # 年度の期首
      def beginning_of_fiscal_year = beginning_of_first_quarter # steep:ignore MethodBodyTypeMismatch

      # 年度の期末
      def end_of_fiscal_year = end_of_fourth_quarter # steep:ignore MethodBodyTypeMismatch

      # 年度の期間
      def all_fiscal_year # steep:ignore MethodBodyTypeMismatch
        ::Range.new(beginning_of_fiscal_year, end_of_fiscal_year)
      end
    end
  end
end

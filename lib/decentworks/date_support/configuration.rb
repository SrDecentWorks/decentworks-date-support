# frozen_string_literal: true

require "date"
require "active_support"
require "active_support/core_ext/module/delegation"

module Decentworks
  module DateSupport
    class << self
      # 設定を変更する
      # 未実行の場合は初期値（1月始まり）が使用される
      def configure
        yield(configuration) if block_given?
      end

      # 設定を取得する
      # configureが未実行の場合は初期値で生成する
      def configuration
        @configuration ||= Configuration.new
      end

      # 開始月名
      delegate :first_quarter_month_name, to: :configuration

      # 開始月数
      delegate :first_quarter_month, to: :configuration

      # 設定を初期化する
      def reset_configuration!
        @configuration = nil
      end

      # 1月始まりとの開始月のずれ
      delegate :first_quarter_month_offset, to: :configuration
    end

    class Configuration
      # { january: 1, february: 2, ... december: 12 }
      MONTHS = ::Date::MONTHNAMES
               .each_with_index
               .filter_map { |name, index| [ name.downcase.to_sym, index ] if name }
               .to_h
               .freeze

      # 開始月の初期値（1月）
      DEFAULT = :january

      # 開始月名
      attr_reader :first_quarter_month_name

      def initialize
        @first_quarter_month_name = DEFAULT
      end

      def first_quarter_month_name=(month_name)
        unless MONTHS.key?(month_name)
          raise ::ArgumentError,
                "first_quarter_month_name must be one of #{MONTHS.keys.inspect} (got #{month_name.inspect})"
        end

        @first_quarter_month_name = month_name
      end

      # 開始月数
      def first_quarter_month = MONTHS.fetch(first_quarter_month_name)

      # 1月始まりとの開始月のずれ
      def first_quarter_month_offset
        first_quarter_month - 1
      end
    end
  end
end

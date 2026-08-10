# frozen_string_literal: true

require "date"
require "active_support/core_ext/module/delegation"

module Decentworks
  module DateSupport
    class << self
      def configure
        @configuration ||= Configuration.new

        yield(@configuration) if block_given?
      end

      def configuration
        raise "Initialization has not been performed." if @configuration.nil?

        @configuration
      end

      # 開始月名
      delegate :beginning_of_first_quarter, to: :configuration

      # 開始月数
      delegate :beginning_of_first_quarter_month, to: :configuration

      # 開始月の初期
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
               .filter_map { |name, index| [name.downcase.to_sym, index] if name }
               .to_h
               .freeze

      # 開始月の初期値（1月）
      DEFAULT = :january

      # 開始月
      attr_reader :beginning_of_first_quarter

      def initialize
        @beginning_of_first_quarter = DEFAULT
      end

      def beginning_of_first_quarter=(month_name)
        unless MONTHS.key?(month_name)
          raise ::ArgumentError,
                "beginning_of_first_quarter must be one of #{MONTHS.keys.inspect} (got #{month_name.inspect})"
        end

        @beginning_of_first_quarter = month_name
      end

      # 開始月数
      def beginning_of_first_quarter_month = MONTHS.fetch(beginning_of_first_quarter)

      # 1月始まりとの開始月のずれ
      def first_quarter_month_offset
        beginning_of_first_quarter_month - 1
      end
    end
  end
end

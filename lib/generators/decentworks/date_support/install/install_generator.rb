# frozen_string_literal: true

require "rails/generators/base"

module Decentworks
  module DateSupport
    module Generators
      # config/initializers/decentworks_date_support.rb を生成するジェネレータ
      #
      # @example
      #   bin/rails generate decentworks:date_support:install
      class InstallGenerator < ::Rails::Generators::Base
        source_root File.expand_path("templates", __dir__)

        desc "config/initializers/decentworks_date_support.rb を生成します。"

        def create_initializer_file
          template(
            "decentworks_date_support.rb.tt",
            "config/initializers/decentworks_date_support.rb"
          )
        end
      end
    end
  end
end

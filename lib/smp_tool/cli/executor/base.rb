# frozen_string_literal: true

module SMPTool
  module CLI
    module Executor
      #
      # Base class all executors inherit from.
      #
      class Base
        def initialize(logger:, **)
          @logger = logger
        end

        def call; end
      end
    end
  end
end

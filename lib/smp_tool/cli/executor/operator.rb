# frozen_string_literal: true

module SMPTool
  module CLI
    module Executor
      #
      # Base class for the executors that do some operation.
      #
      class Operator
        def initialize(logger:, **options)
          @logger = logger
          @options = options
        end

        def call; end
      end
    end
  end
end

# frozen_string_literal: true

module SMPTool
  module CLI
    module Executor
      class Squeezer < VolReadWriteOperator
        include SqueezeMixin

        def call
          _squeeze

          super
        end
      end
    end
  end
end

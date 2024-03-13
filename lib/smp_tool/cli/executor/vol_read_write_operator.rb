# frozen_string_literal: true

module SMPTool
  module CLI
    module Executor
      #
      # Base class for the executors that read a volume and
      # do an operation on it, then save the state back to a file.
      #
      class VolReadWriteOperator < VolReadOperator
        include BinWriteMixin

        def call
          _save_volume(path: @options[:output], volume: @volume, **@options) if @options.key?(:output)
          _save_volume(path: @input, volume: @volume, **@options) if @options[:apply]
        end
      end
    end
  end
end

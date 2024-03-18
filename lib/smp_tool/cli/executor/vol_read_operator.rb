# frozen_string_literal: true

module SMPTool
  module CLI
    module Executor
      #
      # Base class for the executors that read a volume and
      # do an operation on it (without saving back).
      #
      class VolReadOperator
        def initialize(input:, logger:, **options)
          @logger = logger
          @input = input
          @volume = _load_volume(path: input, **options)
          @options = options
        end

        def call; end

        private

        #
        # Read and parse volume out of a binary file.
        #
        # @param [String] path
        #   Path to the source file.
        #
        # @param [Hash{ Symbol => Object }] **_options
        #
        # @return [SMPTool::VirtualVolume::Volume]
        #
        def _load_volume(path:, **_options)
          io = File.binread(path)

          @logger.info "Read data from the file: '#{path}'"

          SMPTool::VirtualVolume::Volume.read_io(
            io
          )
        end
      end
    end
  end
end

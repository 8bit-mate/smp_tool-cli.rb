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
          b_str = _read_bin_file(path)
          @logger.info "Read data from the file: '#{path}'"

          vol = _parse_volume(b_str)
          @logger.debug "Volume parsed"

          vol
        end

        #
        # Parse binary string to create a volume obj.
        #
        # @param [String] b_str
        #
        # @return [SMPTool::VirtualVolume::Volume]
        #
        def _parse_volume(b_str)
          SMPTool::VirtualVolume::Volume.read_io(
            b_str
          )
        end

        #
        # Read a binary file.
        #
        # @param [String] path
        #
        # @return [String]
        #   Binary string with the file's content.
        #
        def _read_bin_file(path)
          Dry::Files.new.read(path)
        end
      end
    end
  end
end

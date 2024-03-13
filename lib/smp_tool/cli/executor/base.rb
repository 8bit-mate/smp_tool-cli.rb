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

        private

        #
        # Save volume to a binary file.
        #
        # @param [String] path
        #   Path to the destination file.
        #
        # @param [SMPTool::VirtualVolume::Volume] volume
        #
        # @param [Hash{ Symbol => Object }] **_options
        #
        def _save_volume(path:, volume:, **_options)
          b_str = _volume_to_binary(volume)
          @logger.debug "Converted to binary string."

          _write_bin_file(
            path,
            b_str
          )

          @logger.info "Changes saved to the file: '#{path}'"
        end

        #
        # Convert virtual volume to binary string.
        #
        # @param [SMPTool::VirtualVolume::Volume] volume
        #
        # @return [String]
        #
        def _volume_to_binary(volume)
          volume.to_binary_s
        end

        #
        # Write data to a binary file.
        #
        # @param [String] path
        #
        # @param [String] data
        #   Binary string with the file's content.
        #
        def _write_bin_file(path, data)
          Dry::Files.new.write(path, data)
        end
      end
    end
  end
end

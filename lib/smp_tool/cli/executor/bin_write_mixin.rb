# frozen_string_literal: true

module SMPTool
  module CLI
    module Executor
      module BinWriteMixin
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
          bin_obj = volume.to_volume_io
          @logger.debug "Converted to VolumeIO of #{bin_obj.num_bytes} bytes"

          _write_bin_file(
            path,
            bin_obj
          )

          @logger.es_info "Changes saved to the file: '#{path}'"
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
        # @param [Object] bin_obj
        #
        def _write_bin_file(path, bin_obj)
          File.open(path, "wb") { |file| bin_obj.write(file) }
        end
      end
    end
  end
end

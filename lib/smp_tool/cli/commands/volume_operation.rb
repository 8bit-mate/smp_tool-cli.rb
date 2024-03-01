# frozen_string_literal: true

module SMPTool
  module CLI
    module Commands
      #
      # Base class for all commands that do some operation on the volume itself.
      #
      class VolumeOperation < Dry::CLI::Command
        option :input,
               required: true,
               desc: "input filename",
               aliases: ["-i", "--input"]

        option :output,
               required: false,
               desc: "output filename",
               aliases: ["-o", "--output"]

        def call(input:, **options)
          volume = _input(input:, **options)
          upd_volume = _command_exe(volume: volume, **options)
          _output(output: options[:output], volume: upd_volume, **options) if options.key?(:output)
        end

        private

        def _command_exe(**); end

        def _input(input:, **options)
          SMPTool::VirtualVolume::Volume.read_io(
            _read_file(input)
          )
        end
        
        def _output(output:, volume:, **options)
          _write_file(
            output,
            volume.to_binary_s
          )
        end

        def _read_file(path)
          files = Dry::Files.new
          files.read(path)
        end

        def _write_file(path, data)
          files = Dry::Files.new
          files.write(path, data)
        end
      end
    end
  end
end

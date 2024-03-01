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

        option :rewrite,
               type: :boolean,
               required: false,
               desc: "apply result to the original *.bin file",
               aliases: ["-r", "--rewrite"]

        def call(input:, rewrite: false, **options)
          volume = _input(input: input, **options)
          upd_volume = _execute(volume: volume, **options)
          _output(output: options[:output], volume: upd_volume, **options) if options.key?(:output)
          _output(output: input, volume: upd_volume, **options) if rewrite
        end

        private

        def _execute(**); end

        def _input(input:, **_options)
          SMPTool::VirtualVolume::Volume.read_io(
            _read_file(input)
          )
        end

        def _output(output:, volume:, **_options)
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

# frozen_string_literal: true

module SMPTool
  module CLI
    module Commands
      #
      # Base class for all commands that do some operation on the volume itself.
      #
      class VolumeOperation < InputCommand
        # option :input,
        #        required: true,
        #        desc: "Input filename",
        #        aliases: ["-i"]

        option :output,
               required: false,
               desc: "Output filename",
               aliases: ["-o"]

        option :apply,
               type: :boolean,
               required: false,
               desc: "Apply result to the input *.bin file",
               aliases: ["-a"]

        #   def call(input:, **options)
        #     volume = _input(path: input, **options)
        #     upd_volume = _execute(volume: volume, **options)
        #     _save_volume(path: options[:output], volume: upd_volume, **options) if options.key?(:output)
        #     _save_volume(path: input, volume: upd_volume, **options) if options[:apply]
        #   end

        #   private

        #   def _execute(**); end

        #   def _input(path:, **_options)
        #     SMPTool::VirtualVolume::Volume.read_io(
        #       _read_bin_file(path)
        #     )
        #   end

        #   def _output(path:, volume:, **_options)
        #     _write_bin_file(
        #       path,
        #       volume.to_binary_s
        #     )

        #     puts "Changes saved to file: #{path}"
        #   end

        #   def _read_bin_file(path)
        #     Dry::Files.new.read(path)
        #   end

        #   def _write_bin_file(path, data)
        #     Dry::Files.new.write(path, data)
        #   end
      end
    end
  end
end

# frozen_string_literal: true

module SMPTool
  module CLI
    module Commands
      #
      # Command to extract files from the volume.
      #
      class Extract < Dry::CLI::Command
        desc "Extract files from the volume."

        option :input,
               required: true,
               desc: "Input filename",
               aliases: ["-i", "--input"]

        option :dir,
               required: false,
               desc: "Output directory",
               aliases: ["-d", "--dir"]

        option :file_list,
               type: :array,
               required: false,
               desc: "File(s) to extract",
               aliases: ["-f"]

        option :all,
               type: :boolean,
               required: false,
               desc: "extract all files",
               aliases: ["-a", "--all"]

        def call(input:, **options)
          _output(
            volume: _input(input: input, **options),
            dir: Dry::Files.new.pwd || options[:dir],
            **options
          )
        end

        private

        def _output(volume:, dir:, **_options)
          puts dir
        end

        def _input(input:, **_options)
          SMPTool::VirtualVolume::Volume.read_io(
            _read_file(input)
          )
        end

        def _read_file(path)
          files = Dry::Files.new
          files.read(path)
        end
      end
    end
  end
end

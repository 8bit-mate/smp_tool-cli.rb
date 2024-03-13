# frozen_string_literal: true

module SMPTool
  module CLI
    module Commands
      #
      # Command to extract all files from the volume.
      #
      class ExtractAll < InputCommand
        desc "Extract all files from the volume"

        option :dir,
               required: false,
               default: Dry::Files.new.pwd,
               desc: "Output directory",
               aliases: ["-d"]

        def call(input:, **options)
          Executor::ExtracterTxtAll.new(
            input: input,
            logger: _logger(options[:verbosity]),
            **options
          ).call
        end
      end
    end
  end
end

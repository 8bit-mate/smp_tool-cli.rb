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

        option :raw,
               type: :boolean,
               default: false,
               required: false,
               desc: "Extract as raw data",
               aliases: ["-r"]

        def call(input:, **options)
          if options[:raw]
            _extract_raw(input: input, **options)
          else
            _extract_txt(input: input, **options)
          end
        end

        private

        def _extract_txt(input:, **options)
          Executor::ExtracterTxtAll.new(
            input: input,
            logger: _logger(options[:verbosity]),
            **options
          ).call
        end

        def _extract_raw(input:, **options)
          Executor::ExtracterRawAll.new(
            input: input,
            logger: _logger(options[:verbosity]),
            **options
          ).call
        end
      end
    end
  end
end

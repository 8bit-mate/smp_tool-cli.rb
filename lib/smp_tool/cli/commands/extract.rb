# frozen_string_literal: true

module SMPTool
  module CLI
    module Commands
      #
      # Command to extract individual files from the volume.
      #
      class Extract < InputCommand
        desc "Extract individual files from the volume"

        option :dir,
               required: false,
               default: Dry::Files.new.pwd,
               desc: "Output directory",
               aliases: ["-d"]

        option :f_list,
               type: :array,
               required: true,
               desc: "File(s) to extract",
               aliases: ["-f"]

        option :raw,
               type: :boolean,
               default: false,
               required: false,
               desc: "Extract as raw data",
               aliases: ["-r"]

        def call(input:, f_list:, **options)
          if options[:raw]
            _extract_raw(input: input, f_list: f_list, **options)
          else
            _extract_txt(input: input, f_list: f_list, **options)
          end
        end

        private

        def _extract_txt(input:, f_list:, **options)
          Executor::ExtracterTxt.new(
            input: input,
            f_list: f_list,
            logger: _logger(options[:verbosity]),
            **options
          ).call
        end

        def _extract_raw(input:, f_list:, **options)
          Executor::ExtracterRaw.new(
            input: input,
            f_list: f_list,
            logger: _logger(options[:verbosity]),
            **options
          ).call
        end
      end
    end
  end
end

# frozen_string_literal: true

module SMPTool
  module CLI
    module Commands
      #
      # Command to list files.
      #
      class ListFiles < InputCommand
        desc "List all files on the volume"

        def call(input:, **options)
          Executor::FileListInformer.new(
            input: input,
            logger: _logger(options[:verbosity]),
            **options
          ).call
        end
      end
    end
  end
end

# frozen_string_literal: true

module SMPTool
  module CLI
    module Commands
      #
      # Command to print info about the volume.
      #
      class Info < InputCommand
        desc "Print info about the volume"

        def call(input:, **options)
          Executor::Informer.new(
            input: input,
            logger: _logger(options[:verbosity]),
            **options
          ).call
        end
      end
    end
  end
end

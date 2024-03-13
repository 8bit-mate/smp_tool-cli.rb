# frozen_string_literal: true

module SMPTool
  module CLI
    module Commands
      #
      # Command to consolidate all free space at the end of a volume.
      #
      class Squeeze < VolumeOperation
        desc "Consolidate all free space at the end of the volume"

        def call(input:, **options)
          Executor::Squeezer.new(
            input: input,
            logger: _logger(options[:verbosity]),
            **options
          ).call
        end
      end
    end
  end
end

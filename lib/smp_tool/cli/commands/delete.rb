# frozen_string_literal: true

module SMPTool
  module CLI
    module Commands
      #
      # Delete a file from the volume.
      #
      class Delete < VolumeOperation
        desc "Delete a file from the volume"

        option :filename,
               required: true,
               desc: "File to delete",
               aliases: ["-f"]

        def call(input:, filename:, **options)
          Executor::Deleter.new(
            input: input,
            filename: filename,
            logger: _logger(options[:verbosity]),
            **options
          ).call
        end
      end
    end
  end
end

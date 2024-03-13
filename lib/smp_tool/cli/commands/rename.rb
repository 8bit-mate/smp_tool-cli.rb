# frozen_string_literal: true

module SMPTool
  module CLI
    module Commands
      #
      # Command to rename a file on the volume.
      #
      class Rename < VolumeOperation
        desc "Rename a file on the volume"

        option :old_fn,
               required: true,
               desc: "File to rename",
               aliases: ["-o"]

        option :new_fn,
               required: true,
               desc: "New filename for the file",
               aliases: ["-n"]

        def call(input:, new_fn:, old_fn:, **options)
          Executor::Renamer.new(
            input: input,
            old_fn: old_fn,
            new_fn: new_fn,
            logger: _logger(options[:verbosity]),
            **options
          ).call
        end
      end
    end
  end
end

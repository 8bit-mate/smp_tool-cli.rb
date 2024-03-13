# frozen_string_literal: true

module SMPTool
  module CLI
    module Commands
      #
      # Command to push a file to the volume.
      #
      class Push < VolumeOperation
        desc "Push a list of files to the volume"

        option :f_list,
               type: :array,
               required: true,
               desc: "File(s) to push",
               aliases: ["-f"]

        def call(input:, f_list:, **options)
          Executor::Pusher.new(
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

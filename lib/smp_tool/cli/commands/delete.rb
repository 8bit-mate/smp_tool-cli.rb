# frozen_string_literal: true

module SMPTool
  module CLI
    module Commands
      #
      # Delete file(s) from the volume.
      #
      class Delete < VolumeOperation
        desc "Delete files from the volume"

        option :f_list,
               type: :array,
               required: true,
               desc: "File(s) to delete",
               aliases: ["-f"]

        option :squeeze,
               type: :boolean,
               required: false,
               default: false,
               desc: "When done, perform the `squeeze` operation",
               aliases: ["-s"]


        def call(input:, f_list:, **options)
          Executor::Deleter.new(
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

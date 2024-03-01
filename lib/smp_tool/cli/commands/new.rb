# frozen_string_literal: true

module SMPTool
  module CLI
    module Commands
      #
      # Command to create a new volume.
      #
      class New < Dry::CLI::Command
        desc "Create a new volume"

        option :input,
               required: false,
               type: :array,
               desc: "input filename(s)",
               aliases: ["-i", "--input"]

        option :output,
               required: true,
               desc: "output filename",
               aliases: ["-o", "--output"]

        option :basic,
               required: true,
               desc: "target Basic version",
               aliases: ["-b", "--basic"]

        def call(output:, basic:, **options)
          if options.key?(:input)
            # pack files...
          end
        end
      end
    end
  end
end

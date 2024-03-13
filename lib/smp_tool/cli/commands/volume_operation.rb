# frozen_string_literal: true

module SMPTool
  module CLI
    module Commands
      #
      # Base class for all commands that do some operation on the volume itself.
      #
      class VolumeOperation < InputCommand
        option :output,
               required: false,
               desc: "Output filename",
               aliases: ["-o"]

        option :apply,
               type: :boolean,
               required: false,
               desc: "Apply result to the input *.bin file",
               aliases: ["-a"]
      end
    end
  end
end

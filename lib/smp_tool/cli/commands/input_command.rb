# frozen_string_literal: true

module SMPTool
  module CLI
    module Commands
      #
      # A command with input.
      #
      class InputCommand < BaseCommand
        option :input,
               required: true,
               desc: "Input filename",
               aliases: ["-i"]
      end
    end
  end
end

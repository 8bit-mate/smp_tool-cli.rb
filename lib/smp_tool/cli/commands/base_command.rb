# frozen_string_literal: true

module SMPTool
  module CLI
    module Commands
      #
      # Base class for all commands.
      #
      class BaseCommand < Dry::CLI::Command
        option :verbosity,
               type: :string,
               required: false,
               default: "brief",
               desc: "Verbosity level: { quiet | brief | verbose | debug }"

        def call(**); end

        private

        def _logger(level)
          Logger.new(level: level)
        end
      end
    end
  end
end

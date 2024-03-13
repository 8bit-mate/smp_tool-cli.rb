# frozen_string_literal: true

module SMPTool
  module CLI
    module Commands
      #
      # Print version.
      #
      class Version < Dry::CLI::Command
        desc "Print version"

        def call(*)
          puts "CLI (smp_tool-cli) version: #{SMPTool::CLI::VERSION}"
          puts "Core lib (smp_tool) version: #{SMPTool::VERSION}"
        end
      end
    end
  end
end

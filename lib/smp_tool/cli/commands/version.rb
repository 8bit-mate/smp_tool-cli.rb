# frozen_string_literal: true

module SMPTool
  module CLI
    module Commands
      class Version < Dry::CLI::Command
        desc "Print version"

        def call(*)
          puts "CLI version: #{SMPTool::CLI::VERSION}"
        end
      end
    end
  end
end

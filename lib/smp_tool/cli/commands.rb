# frozen_string_literal: true

module SMPTool
  module CLI
    module Commands
      extend Dry::CLI::Registry

      register "version", Version, aliases: ["-v", "--version"]
    end
  end
end

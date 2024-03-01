# frozen_string_literal: true

module SMPTool
  module CLI
    module Commands
      extend Dry::CLI::Registry

      register "new", New, aliases: ["-n", "--new"]
      register "squeeze", Squeeze, aliases: ["-s", "--squeeze"]

      register "version", Version, aliases: ["-v", "--version"]
    end
  end
end

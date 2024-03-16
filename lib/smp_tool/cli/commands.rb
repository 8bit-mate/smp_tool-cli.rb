# frozen_string_literal: true

module SMPTool
  module CLI
    #
    # CLI commands.
    #
    module Commands
      extend Dry::CLI::Registry

      register "new", New, aliases: ["n"]

      register "delete", Delete, aliases: %w[d del]
      register "extract", Extract, aliases: ["e"]
      register "extract-all", ExtractAll, aliases: ["x"]
      register "info", Info, aliases: ["i"]
      register "push", Push, aliases: ["p"]
      register "rename", Rename, aliases: ["r"]
      register "resize", Resize, aliases: ["z"]
      register "squeeze", Squeeze, aliases: ["s"]
      register "list-files", ListFiles, aliases: ["l"]

      register "version", Version, aliases: ["-v", "--version"]
    end
  end
end

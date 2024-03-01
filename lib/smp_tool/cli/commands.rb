# frozen_string_literal: true

module SMPTool
  module CLI
    #
    # CLI commands.
    #
    module Commands
      extend Dry::CLI::Registry

      register "new", New, aliases: ["-n", "--new"]

      register "allocate", Allocate, aliases: ["-a", "--allocate"]
      register "delete", Delete, aliases: ["-d", "--del", "--delete"]
      register "info", Info, aliases: ["-i", "--info"]
      register "push_file", PushFile, aliases: ["-p", "--pf", "--push_file"]
      register "rename", Rename, aliases: ["-r", "--rn", "--rename"]
      register "squeeze", Squeeze, aliases: ["-s", "--squeeze"]
      register "trim", Trim, aliases: ["-t", "--trim"]

      register "version", Version, aliases: ["-v", "--version"]
    end
  end
end

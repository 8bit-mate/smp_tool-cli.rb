# frozen_string_literal: true

require "dry/cli"
require "zeitwerk"

require_relative "cli/autoloader"
require_relative "cli/version"

SMPTool::CLI::Autoloader.setup

module SMPTool
  module CLI
    class Error < StandardError; end
    # Your code goes here...
  end
end

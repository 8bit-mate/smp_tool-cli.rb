# frozen_string_literal: true

require "pathname"

module SMPTool
  module CLI
    #
    # Gem's autoloader.
    #
    class Autoloader
      class << self
        def setup
          loader = Zeitwerk::Loader.new
          loader.push_dir(Pathname(__dir__).join("../../")) # lib
          loader.inflector.inflect(
            "smp_tool" => "SMPTool",
            "cli" => "CLI"
          )
          loader.setup
        end
      end
    end
  end
end

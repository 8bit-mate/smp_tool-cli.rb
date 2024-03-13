# frozen_string_literal: true

require "dry/cli"
require "dry/files"
require "smp_tool"
require "zeitwerk"

require_relative "cli/autoloader"
require_relative "cli/version"

SMPTool::CLI::Autoloader.setup

module SMPTool
  module CLI
    class Error < StandardError; end
    AUTO_BL_LBL = "auto"
    DEF_BL_LBL = "default"

    DEF_N_CLUSTERS = 20
    DEF_N_DIR_SEGS = 1
    DEF_N_CLS_PER_DIR_SEG = 2
    DEF_BOOTLOADER = DEF_BL_LBL

    BAS_1_OPT = %w[1 1.0 one].freeze
    BAS_2_OPT = %w[2 2.0 two].freeze

    AUTO_BL_OPT = ["a", AUTO_BL_LBL].freeze
    DEF_BL_OPT = ["d", "def", DEF_BL_LBL].freeze
  end
end

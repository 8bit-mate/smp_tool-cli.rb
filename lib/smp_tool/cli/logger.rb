# frozen_string_literal: true

module SMPTool
  module CLI
    QUIET_MODE = 1
    BRIEF_MODE = 2
    VERBOSE_MODE = 3
    DEBUG_MODE = 4

    LEVELS = {
      "quiet" => QUIET_MODE,
      "brief" => BRIEF_MODE,
      "verbose" => VERBOSE_MODE,
      "debug" => DEBUG_MODE
    }.freeze

    #
    # Simple logger.
    #
    class Logger
      def initialize(level: "brief")
        @level = _choose_level(level)
      end

      # Low-priority info.
      def info(msg)
        _print_msg(msg, "Info", VERBOSE_MODE) { |s| puts s }
      end

      # Essential info.
      def es_info(msg)
        _print_msg(msg, "Info", BRIEF_MODE) { |s| puts s }
      end

      # Warning.
      def warning(msg)
        _print_msg(msg, "Warn", QUIET_MODE) { |s| warn s }
      end

      # Error.
      def error(msg)
        _print_msg(msg, "Error", QUIET_MODE) { |s| warn s }
      end

      # Debug message.
      def debug(msg)
        _print_msg(msg, "Debug", DEBUG_MODE) { |s| puts s }
      end

      private

      def _print_msg(msg, type, mode)
        return unless mode <= @level

        msg = "[#{type}]: #{msg}"

        yield(msg)
      end

      def _choose_level(key)
        raise ArgumentError, "Wrong verbosity level: #{key}" unless LEVELS.key?(key.downcase)

        LEVELS[key.downcase]
      end
    end
  end
end

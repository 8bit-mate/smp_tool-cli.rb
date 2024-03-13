# frozen_string_literal: true

module SMPTool
  module CLI
    module Executor
      class Creator
        include BinWriteMixin

        def initialize(output:, volume_specs:, logger:, **options)
          @logger = logger
          @output = output
          @volume_specs = volume_specs
          @options = options
        end

        def call
          vol = SMPTool::VirtualVolume::Volume.new(
            bootloader: @volume_specs.bootloader,
            home_block: @volume_specs.home_block,
            volume_params: @volume_specs.volume_params
          )

          @logger.debug "Virtual volume created"

          _save_volume(path: @output, volume: vol, **@options)
        end
      end
    end
  end
end

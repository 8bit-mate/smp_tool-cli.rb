# frozen_string_literal: true

module SMPTool
  module CLI
    module Executor
      class Creator
        def initialize(output:, vol_params:, logger:, **options)
          @logger = logger
          @output = output
          @vol_params = vol_params
          @options = options
        end

        def call
          # volume = SMPTool::VirtualVolume::Volume.new(

          # )
        end
      end
    end
  end
end

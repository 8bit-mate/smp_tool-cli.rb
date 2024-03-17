# frozen_string_literal: true

module SMPTool
  module CLI
    module Executor
      class ExtracterRawAll < ExtracterRawBase
        private

        def _extract_files
          @volume.f_extract_raw_all
        end
      end
    end
  end
end

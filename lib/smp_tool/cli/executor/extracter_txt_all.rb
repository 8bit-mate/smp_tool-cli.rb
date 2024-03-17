# frozen_string_literal: true

module SMPTool
  module CLI
    module Executor
      class ExtracterTxtAll < ExtracterTxtBase
        private

        def _extract_files
          @volume.f_extract_txt_all
        end
      end
    end
  end
end

# frozen_string_literal: true

module SMPTool
  module CLI
    module Executor
      class ExtracterRaw < ExtracterRawBase
        private

        def _extract_files
          @options[:f_list].map do |fn|
            @volume.f_extract_raw(fn)
          end
        end
      end
    end
  end
end

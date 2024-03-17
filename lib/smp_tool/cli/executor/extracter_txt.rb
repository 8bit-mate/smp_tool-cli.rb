# frozen_string_literal: true

module SMPTool
  module CLI
    module Executor
      class ExtracterTxt < ExtracterTxtBase
        private

        def _extract_files
          @options[:f_list].map do |fn|
            @volume.f_extract_txt(fn)
          end
        end
      end
    end
  end
end

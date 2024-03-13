# frozen_string_literal: true

module SMPTool
  module CLI
    module Executor
      class ExtracterTxt < ExtracterBase
        private

        def _extract_files
          @options[:f_list].map do |fn|
            @volume.f_extract_txt(fn)
          end
        end

        def _write_file(path, file_obj)
          dry_files = Dry::Files.new
          dry_files.write(path, file_obj.data.join("\n"))
        end
      end
    end
  end
end

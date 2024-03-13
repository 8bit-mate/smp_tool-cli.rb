# frozen_string_literal: true

module SMPTool
  module CLI
    module Executor
      class ExtracterTxtAll < ExtracterBase
        private

        def _extract_files
          @volume.f_extract_txt_all
        end

        def _write_file(path, file_obj)
          dry_files = Dry::Files.new
          dry_files.write(path, file_obj.data.join("\n"))
        end
      end
    end
  end
end

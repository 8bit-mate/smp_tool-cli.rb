# frozen_string_literal: true

module SMPTool
  module CLI
    module Executor
      class ExtracterRawAll < ExtracterBase
        private

        def _extract_files
          @volume.f_extract_raw_all
        end

        def _write_file(path, file_obj)
          dry_files = Dry::Files.new
          dry_files.write(path, file_obj.data)
        end

        def _filter_filename(filename)
          "#{super}.bin"
        end
      end
    end
  end
end

# frozen_string_literal: true

module SMPTool
  module CLI
    module Executor
      class ExtracterRawBase < ExtracterBase
        private

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

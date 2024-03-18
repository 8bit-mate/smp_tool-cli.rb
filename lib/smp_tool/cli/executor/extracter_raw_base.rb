# frozen_string_literal: true

module SMPTool
  module CLI
    module Executor
      class ExtracterRawBase < ExtracterBase
        private

        def _save_file(path, file_obj)
          _write_data(path, file_obj.data)
        end

        def _write_data(path, data)
          File.binwrite(path, data)
        end

        def _filter_filename(filename)
          "#{super}.bin"
        end
      end
    end
  end
end

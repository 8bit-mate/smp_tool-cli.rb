# frozen_string_literal: true

module SMPTool
  module CLI
    module Executor
      class ExtracterTxtBase < ExtracterBase
        private

        def _save_file(path, file_obj)
          _write_data(path, file_obj.data.join("\n"))
        end

        def _write_data(path, data)
          File.binwrite(path, data)
        end
      end
    end
  end
end

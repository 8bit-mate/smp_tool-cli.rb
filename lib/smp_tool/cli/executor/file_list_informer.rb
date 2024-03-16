# frozen_string_literal: true

module SMPTool
  module CLI
    module Executor
      #
      # Lists files on the volume.
      #
      class FileListInformer < VolReadOperator
        def call
          snapshot = @volume.snapshot

          _list_files(snapshot[:volume_data])

          super
        end

        private

        def _list_files(vol_data)
          vol_data.reject { |e| e[:status] == "empty" }
                  .each { |e| puts e[:filename] }
        end
      end
    end
  end
end

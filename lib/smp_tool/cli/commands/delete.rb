# frozen_string_literal: true

module SMPTool
  module CLI
    module Commands
      #
      # Delete a file from the volume.
      #
      class Delete < VolumeOperation
        desc "Delete a file from the volume"

        option :filename,
               required: true,
               desc: "File to delete",
               aliases: ["-f"]

        private

        def _execute(volume:, filename:, **)
          volume.f_delete(filename)
        end
      end
    end
  end
end

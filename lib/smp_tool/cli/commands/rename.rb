# frozen_string_literal: true

module SMPTool
  module CLI
    module Commands
      #
      # Command to rename a file on the volume.
      #
      class Rename < VolumeOperation
        desc "Rename a file on the volume"

        option :old,
               required: true,
               desc: "File to rename",
               aliases: ["-o"]

        option :new,
               required: true,
               desc: "New filename for the file",
               aliases: ["-n"]

        private

        def _execute(volume:, old:, new:, **)
          volume.f_rename(old, new)
        end
      end
    end
  end
end

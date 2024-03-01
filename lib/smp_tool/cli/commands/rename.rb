# frozen_string_literal: true

module SMPTool
  module CLI
    module Commands
      #
      # Command to rename a file on the volume.
      #
      class Rename < VolumeOperation
        desc "Rename a file on the volume."

        option :old_filename,
               required: true,
               desc: "old filename",
               aliases: ["--old_fn", "--old_filename"]

        option :new_filename,
               required: true,
               desc: "new filename",
               aliases: ["--new_fn", "--new_filename"]

        private

        def _execute(volume:, old_filename:, new_filename:, **)
          volume.f_rename(old_filename, new_filename)
        end
      end
    end
  end
end

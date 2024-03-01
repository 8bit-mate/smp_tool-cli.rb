# frozen_string_literal: true

module SMPTool
  module CLI
    module Commands
      #
      # Command to delete all free space.
      #
      class Trim < VolumeOperation
        desc "Delete all free space."

        private

        def _execute(volume:, **)
          volume.trim
        end
      end
    end
  end
end

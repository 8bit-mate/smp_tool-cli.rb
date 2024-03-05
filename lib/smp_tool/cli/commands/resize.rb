# frozen_string_literal: true

module SMPTool
  module CLI
    module Commands
      #
      # Command to change volume size.
      #
      class Resize < VolumeOperation
        desc "Change volume size."

        option :n_clusters,
               required: true,
               desc: "number of clusters to add/trim",
               aliases: ["-n", "--n_clusters"]

        private

        def _execute(volume:, n_clusters:, **)
          volume.change_size(n_clusters.to_i)
        end
      end
    end
  end
end

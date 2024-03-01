# frozen_string_literal: true

module SMPTool
  module CLI
    module Commands
      #
      # Command to allocate more clusters.
      #
      class Allocate < VolumeOperation
        desc "Allocate more clusters."

        option :n_add_clusters,
               required: true,
               desc: "number of additional clusters",
               aliases: ["-n", "--n_clusters"]

        private

        def _execute(volume:, n_add_clusters:, **)
          volume.add_clusters(n_add_clusters.to_i)
        end
      end
    end
  end
end

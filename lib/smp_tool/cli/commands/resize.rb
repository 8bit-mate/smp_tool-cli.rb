# frozen_string_literal: true

module SMPTool
  module CLI
    module Commands
      #
      # Command to change volume size.
      #
      class Resize < VolumeOperation
        desc "Change volume size"

        option :clusters,
               required: true,
               desc: "Number of clusters to add/trim",
               aliases: ["-c"]

        private

        def _execute(volume:, clusters:, **)
          volume.change_size(clusters.to_i)

          puts _msg(clusters.to_i)
        end

        def _msg(n_clusters)
          if n_clusters.negative?
            "#{n_clusters} clusters were trimmed from the volume"
          elsif n_clusters.positive?
            "#{n_clusters} clusters were added to the volume."
          else
            "No changes were made."
          end
        end
      end
    end
  end
end

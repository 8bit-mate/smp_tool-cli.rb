# frozen_string_literal: true

module SMPTool
  module CLI
    module Executor
      class Resizer < VolReadWriteOperator
        def call
          n_clusters_changed = @volume.resize(@options[:n_clusters].to_i)
          @logger.es_info _msg(n_clusters_changed)

          super
        end

        private

        def _msg(n_clusters)
          if n_clusters.negative?
            "#{n_clusters.abs} clusters were trimmed from the volume"
          elsif n_clusters.positive?
            "#{n_clusters} clusters were added to the volume"
          else
            "No changes were made"
          end
        end
      end
    end
  end
end

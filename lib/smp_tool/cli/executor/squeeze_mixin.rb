# frozen_string_literal: true

module SMPTool
  module CLI
    module Executor
      module SqueezeMixin
        private

        def _squeeze
          n_free_clusters = @volume.squeeze
          @logger.es_info "#{n_free_clusters} clusters were joined into one section at the end of the volume"
        end
      end
    end
  end
end

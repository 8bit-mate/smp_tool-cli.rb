# frozen_string_literal: true

module SMPTool
  module CLI
    module Executor
      class Squeezer < VolReadWriteOperator
        def call
          n_free_clusters = @volume.squeeze
          @logger.es_info "#{n_free_clusters} clusters were joined into one section at the end of the volume"

          super
        end
      end
    end
  end
end

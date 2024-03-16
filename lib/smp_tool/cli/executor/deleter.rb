# frozen_string_literal: true

module SMPTool
  module CLI
    module Executor
      class Deleter < VolReadWriteOperator
        def call
          @options[:f_list].each do |file|
            fn = @volume.f_delete(file)
            @logger.info "File '#{fn}' was deleted from the volume"
          end

          @logger.es_info "#{@options[:f_list].length} files were deleted from the volume"

          _squeeze if @options[:squeeze]

          super
        end

        private

        def _squeeze
          n_free_clusters = @volume.squeeze
          @logger.es_info "#{n_free_clusters} clusters were joined into one section at the end of the volume"
        end
      end
    end
  end
end

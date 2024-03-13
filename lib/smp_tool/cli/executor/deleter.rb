# frozen_string_literal: true

module SMPTool
  module CLI
    module Executor
      class Deleter < VolReadWriteOperator
        def call
          fn = @volume.f_delete(@options[:filename])
          @logger.es_info "File '#{fn}' was deleted from the volume"

          super
        end
      end
    end
  end
end

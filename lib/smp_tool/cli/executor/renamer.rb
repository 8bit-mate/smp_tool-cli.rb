# frozen_string_literal: true

module SMPTool
  module CLI
    module Executor
      class Renamer < VolReadWriteOperator
        def call
          fns = @volume.f_rename(@options[:old_fn], @options[:new_fn])
          @logger.es_info "File '#{fns.first}' was renamed to '#{fns.last}'"

          super
        end
      end
    end
  end
end

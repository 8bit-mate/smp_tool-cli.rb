# frozen_string_literal: true

module SMPTool
  module CLI
    module Executor
      class Deleter < VolReadWriteOperator
        include SqueezeMixin

        def call
          @options[:f_list].each do |file|
            fn = @volume.f_delete(file)
            @logger.info "File '#{fn}' was deleted from the volume"
          end

          @logger.es_info "#{@options[:f_list].length} files were deleted from the volume"

          _squeeze if @options[:squeeze]

          super
        end
      end
    end
  end
end

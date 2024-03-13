# frozen_string_literal: true

module SMPTool
  module CLI
    module Executor
      class Pusher < VolReadWriteOperator
        def call
          files = _read_files(@options[:f_list])

          files.each do |f|
            fn = @volume.f_push(f)

            @logger.info "File '#{fn}' pushed to the volume"
          end

          @logger.es_info "#{files.length} files were pushed to the volume"

          super
        end

        private

        def _read_files(f_list)
          f_list.map do |path|
            {
              filename: File.basename(path),
              data: _read_file(path).split(/\n/)
            }
          end
        end

        def _read_file(path)
          @logger.debug "Reading the file: '#{path}'"
          Dry::Files.new.read(path)
        end
      end
    end
  end
end

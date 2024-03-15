# frozen_string_literal: true

module SMPTool
  module CLI
    module Executor
      class ExtracterBase < VolReadOperator
        def call
          files = _extract_files
          @logger.debug("Files were extracted from the volume")
          _output(files)
        end

        private

        def _extract_files; end

        def _output(f_arr)
          dry_files = Dry::Files.new

          f_arr.each do |f|
            path = dry_files.join(@options[:dir], _filter_filename(f.filename))
            _write_file(path, f)
            @logger.info "File '#{path}' created"
          end

          @logger.es_info "#{f_arr.length} files were extracted to the directory: '#{@options[:dir]}'"
        end

        # Remove trailing spaces from the base filename and ext.
        def _filter_filename(filename)
          base = File.basename(filename, ".*").rstrip
          ext = File.extname(filename).rstrip

          base + ext
        end

        def _write_file(path, _file_obj); end
      end
    end
  end
end

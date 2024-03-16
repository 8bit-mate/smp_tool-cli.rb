# frozen_string_literal: true

module SMPTool
  module CLI
    module Executor
      class ExtracterRaw < ExtracterBase
        private

        def _extract_files
          @options[:f_list].map do |fn|
            @volume.f_extract_raw(fn)
          end
        end

        def _write_file(path, file_obj)
          dry_files = Dry::Files.new
          dry_files.write(path, file_obj.data)
        end

        def _filter_filename(filename)
          "#{super}.bin"
        end
      end
    end
  end
end

# frozen_string_literal: true

module SMPTool
  module CLI
    module Commands
      #
      # Command to push a file to the volume.
      #
      class Push < VolumeOperation
        desc "Push a list of files to the volume"

        option :f_list,
               type: :array,
               required: true,
               desc: "File(s) to push",
               aliases: ["-f"]

        private

        def _execute(volume:, f_list:, **)
          files = _read_files(f_list)
          volume.f_push(*files)
        end

        def _read_files(f_list)
          files = Dry::Files.new

          f_list.map do |path|
            {
              filename: File.basename(path),
              data: files.read(path).split(/\n/)
            }
          end
        end
      end
    end
  end
end

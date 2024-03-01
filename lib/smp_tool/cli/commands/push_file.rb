# frozen_string_literal: true

module SMPTool
  module CLI
    module Commands
      #
      # Command to push a file to the volume.
      #
      class PushFile < VolumeOperation
        desc "Push a list of files to the volume."

        option :file_list,
               type: :array,
               required: true,
               desc: "file(s) to push",
               aliases: ["-f", "--fl", "--file_list"]

        private

        def _execute(volume:, file_list:, **)
          files = _read_files(file_list)
          volume.f_push(*files)
        end

        def _read_files(file_list)
          files = Dry::Files.new

          file_list.map do |path|
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

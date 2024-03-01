# frozen_string_literal: true

module SMPTool
  module CLI
    module Commands
      #
      # Command to create a new volume.
      #
      class New < Dry::CLI::Command
        desc "Create a new volume."

        BAS_1_LBL = "1"
        BAS_2_LBL = "2"

        AUTO_BL_LBL = "auto"
        DEF_BL_LBL = "default"

        DEF_N_CLUSTERS = 20
        DEF_N_DIR_SEGS = 1
        DEF_N_CLS_PER_DIR_SEG = 2
        DEF_BOOTLOADER = DEF_BL_LBL

        option :output,
               required: true,
               desc: "output filename",
               aliases: ["-o", "--output"]

        option :basic,
               required: true,
               desc: "target Basic version",
               aliases: ["-b", "--basic"]

        option :n_clusters_allocated,
               default: DEF_N_CLUSTERS,
               required: false,
               desc: "number of clusters allocated to the volume",
               aliases: ["-c", "--clusters"]

        option :n_dir_segs,
               default: DEF_N_DIR_SEGS,
               required: false,
               desc: "number of directory segments (1 or 2)",
               aliases: ["-d", "--dir_segs"]

        option :n_clusters_per_dir_seg,
               default: DEF_N_CLS_PER_DIR_SEG,
               required: false,
               desc: "number of clusters per directory segment (1 or 2)",
               aliases: ["-s", "--dir_seg_size"]

        option :bootloader_type,
               default: DEF_BOOTLOADER,
               required: false,
               desc: "bootloader type (default or auto)",
               aliases: ["-b", "--bootloader"]

        def call(output:, basic:, **options)
          volume = SMPTool::VirtualVolume::Volume.new(
            bootloader: SMPTool::Basic10::DEFAULT_BOOTLOADER,
            home_block: SMPTool::Basic10::HOME_BLOCK,
            volume_params: _volume_params(options)
          )

          _output(output: output, volume: volume, **options)
        end

        private

        def _volume_params(options)
          {
            n_clusters_allocated: options[:n_clusters_allocated].to_i,
            n_extra_bytes_per_entry: 0,
            n_dir_segs: options[:n_dir_segs].to_i,
            n_clusters_per_dir_seg: options[:n_clusters_per_dir_seg].to_i,
            extra_word: 0
          }
        end

        def _output(output:, volume:, **_options)
          _write_file(
            output,
            volume.to_binary_s
          )
        end

        def _write_file(path, data)
          files = Dry::Files.new
          files.write(path, data)
        end

        # def _choose_bootloader_name()

        # def _choose_basic_namespace(basic_ver)
        #   case basic_ver
        #   when BAS_2_LBL
        #     SMPTool::Basic20
        #   else
        #     SMPTool::Basic10
        #   end
        # end
      end
    end
  end
end

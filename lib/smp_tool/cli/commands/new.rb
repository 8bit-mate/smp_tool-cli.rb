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

        def call(basic:, **options); end

        # def _volume_params(options)
        #   {
        #     bootloader: SMPTool::Basic10::DEFAULT_BOOTLOADER,
        #     home_block: SMPTool::Basic10::HOME_BLOCK,
        #     n_clusters_allocated: 20,
        #     n_extra_bytes_per_entry: 0,
        #     n_dir_segs: 1,
        #     n_clusters_per_dir_seg: 2,
        #     extra_word: 0
        #   }
        # end

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

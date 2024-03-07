# frozen_string_literal: true

module SMPTool
  module CLI
    module Commands
      #
      # Command to create a new volume.
      #
      class New < Dry::CLI::Command
        desc "Create a new volume"

        BAS_1_LBL = "1"
        BAS_2_LBL = "2"

        AUTO_BL_LBL = "auto"
        DEF_BL_LBL = "default"

        DEF_N_CLUSTERS = 20
        DEF_N_DIR_SEGS = 1
        DEF_N_CLS_PER_DIR_SEG = 2
        DEF_BOOTLOADER = DEF_BL_LBL

        BAS_1_OPT = %w[1 1.0 one].freeze
        BAS_2_OPT = %w[2 2.0 two].freeze

        AUTO_BL_OPT = ["a", AUTO_BL_LBL].freeze
        DEF_BL_OPT = ["d", "def", DEF_BL_LBL].freeze

        option :output,
               default: "smp0.bin",
               required: false,
               desc: "Output filename",
               aliases: ["-o"]

        option :basic,
               required: true,
               desc: "Target Basic version",
               aliases: ["-b"]

        option :clusters,
               default: DEF_N_CLUSTERS,
               required: false,
               desc: "Number of clusters allocated to the volume",
               aliases: ["-c"]

        option :dir_segs,
               default: DEF_N_DIR_SEGS,
               required: false,
               desc: "Number of directory segments (1 or 2)",
               aliases: ["-d"]

        option :dir_seg_size,
               default: DEF_N_CLS_PER_DIR_SEG,
               required: false,
               desc: "Number of clusters per directory segment (1 or 2)",
               aliases: ["-s"]

        option :bootloader,
               default: DEF_BOOTLOADER,
               required: false,
               desc: "Bootloader type (default or auto)",
               aliases: ["-l"]

        def call(output:, basic:, **options)
          namespace = _basic_namespace(basic)

          volume = SMPTool::VirtualVolume::Volume.new(
            bootloader: _bl_constant(namespace, options[:bootloader]),
            home_block: namespace::HOME_BLOCK,
            volume_params: _volume_params(namespace, options)
          )

          _output(output: output, volume: volume, **options)
        end

        private

        def _bl_constant(namespace, bootloader)
          if AUTO_BL_LBL.include?(bootloader.downcase)
            namespace::AUTO_BOOTLOADER
          elsif DEF_BL_LBL.include?(bootloader.downcase)
            namespace::DEFAULT_BOOTLOADER
          else
            raise ArgumentError, "Unknown bootloader type, supported values are: "\
                                 "#{AUTO_BL_LBL}, #{DEF_BOOTLOADER}"
          end
        end

        def _basic_namespace(basic)
          if BAS_1_OPT.include?(basic.downcase)
            SMPTool::Basic10
          elsif BAS_2_OPT.include?(basic.downcase)
            SMPTool::Basic20
          else
            raise ArgumentError, "Unknown BASIC version, supported values are: "\
                                 "#{BAS_1_OPT}, #{BAS_2_OPT}"
          end
        end

        def _volume_params(namespace, options)
          {
            n_clusters_allocated: options[:clusters].to_i,
            n_extra_bytes_per_entry: namespace::N_EXTRA_BYTES_PER_ENTRY,
            n_dir_segs: options[:dir_segs].to_i,
            n_clusters_per_dir_seg: options[:dir_seg_size].to_i,
            extra_word: namespace::ENTRY_EXTRA_WORD
          }
        end

        def _output(output:, volume:, **_options)
          volume.to_binary_s

          _write_file(
            output,
            volume.to_binary_s
          )
        end

        def _write_file(path, data)
          files = Dry::Files.new
          files.write(path, data)
        end
      end
    end
  end
end

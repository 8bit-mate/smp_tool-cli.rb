# frozen_string_literal: true

module SMPTool
  module CLI
    module Commands
      #
      # Command to create a new volume.
      #
      class New < BaseCommand
        desc "Create a new volume"

        option :output,
               default: "smp0.bin",
               required: false,
               desc: "Output filename",
               aliases: ["-o"]

        option :basic,
               required: true,
               desc: "Target Basic version",
               aliases: ["-b"]

        option :n_clusters,
               default: DEF_N_CLUSTERS,
               required: false,
               desc: "Number of clusters allocated to the volume",
               aliases: ["-c"]

        option :n_dir_segs,
               default: DEF_N_DIR_SEGS,
               required: false,
               desc: "Number of directory segments (1 or 2)",
               aliases: ["-d"]

        option :n_cls_per_dir_seg,
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
          vol_params = _parse_vol_params(basic, options)

          Executor::Creator.new(
            output: output,
            vol_params: vol_params,
            logger: _logger(options[:verbosity]),
            **options
          ).call
        end

        private

        def _parse_vol_params(basic, options)
          VolParamsInterface.new(
            basic: basic,
            bootloader: options[:bootloader],
            n_clusters: options[:n_clusters],
            n_dir_segs: options[:n_dir_segs],
            n_cls_per_dir_seg: options[:n_cls_per_dir_seg]
          ).call
        end
      end
    end
  end
end

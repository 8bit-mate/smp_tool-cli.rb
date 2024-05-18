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
               desc: "Target BASIC version { 1 | 2 }",
               aliases: ["-b"]

        option :n_clusters,
               default: DEF_N_CLUSTERS,
               required: false,
               desc: "Number of 512-byte clusters allocated to the volume (4..127)",
               aliases: ["-c"]

        option :n_dir_segs,
               default: DEF_N_DIR_SEGS,
               required: false,
               desc: "Number of directory segments { 1 | 2 }",
               aliases: ["-d"]

        option :n_cls_per_dir_seg,
               default: DEF_N_CLS_PER_DIR_SEG,
               required: false,
               desc: "Number of clusters per directory segment { 1 | 2 }",
               aliases: ["-s"]

        option :bootloader,
               default: DEF_BOOTLOADER,
               required: false,
               desc: "Bootloader type { default | auto }",
               aliases: ["-l"]

        example [
          "-b 1                   # Create a BASIC v.1.0 volume with the default parameters, " \
                                  "save result to the `smp0.bin` file (default path)",
          "-b 2 -o dir/smp.bin    # Create a BASIC v.2.0 volume with the default parameters, " \
                                  "save result to the `dir/smp.bin` file (custom path)",
          "-b 2 -l auto           # Create a BASIC v.2.0 volume with the auto-loader",
          "-b 1 -c 127 -d 2       # Create the largest possible BASIC v.1.0 volume",
          "-b 1 -s 1              # Create a BASIC v.1.0 volume with the 'trimmed' directory"
        ]

        def call(output:, basic:, **options)
          Executor::Creator.new(
            output: output,
            volume_specs: _parse_vol_specs(basic, options),
            logger: _logger(options[:verbosity]),
            **options
          ).call
        end

        private

        def _parse_vol_specs(basic, options)
          VolumeSpecsInterface.new(
            basic: basic,
            bootloader: options[:bootloader],
            n_clusters: options[:n_clusters],
            n_dir_segs: options[:n_dir_segs],
            n_cls_per_dir_seg: options[:n_cls_per_dir_seg]
          )
        end
      end
    end
  end
end

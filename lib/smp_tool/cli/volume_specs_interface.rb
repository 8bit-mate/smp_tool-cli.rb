# frozen_string_literal: true

module SMPTool
  module CLI
    class VolumeSpecsInterface
      def initialize(basic:, n_clusters:, n_dir_segs:, n_cls_per_dir_seg:, bootloader:)
        @basic = basic.downcase
        @n_clusters = n_clusters.to_i
        @n_dir_segs = n_dir_segs.to_i
        @n_cls_per_dir_seg = n_cls_per_dir_seg.to_i
        @bootloader = bootloader.downcase

        @namespace = _basic_namespace
      end

      def bootloader
        _choose_bootloader
      end

      def home_block
        @namespace::HOME_BLOCK
      end

      def volume_params
        _volume_params
      end

      private

      def _choose_bootloader
        if AUTO_BL_LBL.include?(@bootloader)
          @namespace::AUTO_BOOTLOADER
        elsif DEF_BL_LBL.include?(@bootloader)
          @namespace::DEFAULT_BOOTLOADER
        else
          raise ArgumentError, "Unknown bootloader type, supported values are: "\
                               "#{AUTO_BL_LBL}, #{DEF_BOOTLOADER}"
        end
      end

      def _basic_namespace
        if BAS_1_OPT.include?(@basic)
          SMPTool::Basic10
        elsif BAS_2_OPT.include?(@basic)
          SMPTool::Basic20
        else
          raise ArgumentError, "Unknown BASIC version, supported values are: "\
                               "#{BAS_1_OPT}, #{BAS_2_OPT}"
        end
      end

      def _volume_params
        SMPTool::VirtualVolume::VolumeParams.new(
          n_clusters_allocated: @n_clusters,
          n_extra_bytes_per_entry: @namespace::N_EXTRA_BYTES_PER_ENTRY,
          n_dir_segs: @n_dir_segs,
          n_clusters_per_dir_seg: @n_cls_per_dir_seg,
          extra_word: @namespace::ENTRY_EXTRA_WORD
        )
      end
    end
  end
end

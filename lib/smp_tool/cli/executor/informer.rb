# frozen_string_literal: true

module SMPTool
  module CLI
    module Executor
      #
      # Prints info about the volume.
      #
      class Informer < VolReadOperator
        VOL_PAR_L = 24

        F_NUM_L = 5
        F_STATUS_L = 10
        F_NAME_L = 13
        F_SIZE_L = 4

        def call
          snapshot = @volume.snapshot

          _list_files(snapshot[:volume_data])
          puts ""
          puts "--- Volume information: ---"
          _print_n_free_clusters(snapshot[:n_free_clusters])
          _print_vol_params(snapshot[:volume_params])

          super
        end

        def _choose_basic(extra_word)
          case extra_word
          when SMPTool::Basic10::ENTRY_EXTRA_WORD
            "BASIC v.1.0"
          when SMPTool::Basic20::ENTRY_EXTRA_WORD
            "BASIC v.2.0"
          else
            "unknown"
          end
        end

        def _print_n_free_clusters(n_free_clusters)
          puts "N. free clusters:".ljust(VOL_PAR_L) + n_free_clusters.to_s
        end

        def _print_vol_params(vol_params)
          puts "N. clusters allocated:".ljust(VOL_PAR_L) << vol_params[:n_clusters_allocated].to_s
          puts "N. dir. segments:".ljust(VOL_PAR_L) << vol_params[:n_dir_segs].to_s
          puts "Dir. seg. size:".ljust(VOL_PAR_L) << vol_params[:n_clusters_per_dir_seg].to_s
          puts "Directory capacity:".ljust(VOL_PAR_L) << vol_params[:n_max_entries].to_s
          puts "Volume type:".ljust(VOL_PAR_L) << _choose_basic(vol_params[:extra_word])
        end

        def _list_files(vol_data)
          _print_file_list_legend
          vol_data.each_with_index { |e, i| _print_file_entry(i, e) }
        end

        def _print_file_list_legend
          legend = [
            "#".ljust(F_NUM_L),
            "Status".ljust(F_STATUS_L),
            "Filename".ljust(F_NAME_L),
            "Size".to_s.ljust(F_SIZE_L)
          ].join("")

          puts legend
          puts legend.gsub(/[^ ]/, "-")
        end

        def _print_file_entry(idx, entry)
          puts (idx + 1).to_s.ljust(F_NUM_L) +
               entry[:status].ljust(F_STATUS_L) +
               entry[:filename].ljust(F_NAME_L) +
               entry[:n_clusters].to_s.ljust(F_SIZE_L)
        end
      end
    end
  end
end

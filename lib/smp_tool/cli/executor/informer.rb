# frozen_string_literal: true

module SMPTool
  module CLI
    module Executor
      #
      # Prints info about the volume.
      #
      class Informer < VolReadOperator
        PAR_PRINT_LENGTH = 24

        def call
          snapshot = @volume.snapshot

          _list_files(snapshot[:volume_data])
          puts "--- Volume information: ---"
          _print_n_free_clusters(snapshot[:n_free_clusters])
          _print_vol_params(snapshot[:volume_params])
          _print_dir_capacity(snapshot[:n_max_entries])
          _print_vol_type(snapshot[:volume_params])

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

        def _print_vol_type(vol_params)
          puts "Volume type:".ljust(PAR_PRINT_LENGTH) + _choose_basic(vol_params[:extra_word])
        end

        def _print_n_free_clusters(n_free_clusters)
          puts "N. free clusters:".ljust(PAR_PRINT_LENGTH) + n_free_clusters.to_s
        end

        def _print_dir_capacity(n_max_entries)
          puts "Directory capacity:".ljust(PAR_PRINT_LENGTH) + n_max_entries.to_s
        end

        def _print_vol_params(vol_params)
          puts "N. clusters allocated:".ljust(PAR_PRINT_LENGTH) + vol_params[:n_clusters_allocated].to_s
          puts "N. dir. segments:".ljust(PAR_PRINT_LENGTH) + vol_params[:n_dir_segs].to_s
          puts "Dir. seg. size:".ljust(PAR_PRINT_LENGTH) + vol_params[:n_clusters_per_dir_seg].to_s
        end

        def _list_files(vol_data)
          puts "Status".ljust(10) + "Filename".ljust(14) + "Size".to_s.ljust(4)
          puts "------".ljust(10) + "--------".ljust(14) + "----".to_s.ljust(4)

          vol_data.each { |e| _print_file_entry(e) }
        end

        def _print_file_entry(entry)
          puts entry[:status].ljust(10) + entry[:filename].ljust(14) + entry[:n_clusters].to_s.ljust(4)
        end
      end
    end
  end
end

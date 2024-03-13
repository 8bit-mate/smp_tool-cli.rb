# frozen_string_literal: true

module SMPTool
  module CLI
    module Commands
      #
      # Command to change volume size.
      #
      class Resize < VolumeOperation
        desc "Change volume size"

        option :n_clusters,
               required: true,
               desc: "Number of clusters to add/trim",
               aliases: ["-c"]

        def call(input:, n_clusters:, **options)
          Executor::Resizer.new(
            input: input,
            n_clusters: n_clusters,
            logger: _logger(options[:verbosity]),
            **options
          ).call
        end
      end
    end
  end
end

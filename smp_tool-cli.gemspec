# frozen_string_literal: true

require_relative "lib/smp_tool/cli/version"

Gem::Specification.new do |spec|
  spec.name = "smp_tool-cli"
  spec.version = SMPTool::CLI::VERSION
  spec.authors = ["8bit-m8"]
  spec.email = ["you@example.com"]

  spec.summary = "CLI for the smp_tool lib."
  spec.homepage = "https://github.com/8bit-mate/smp_tool-cli.rb"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end

  spec.bindir = "exe"
  spec.executables = ["smp_tool"]
  spec.require_paths = ["lib"]

  spec.add_dependency "dry-cli", "~> 1.0", ">= 1.0.0"
  spec.add_dependency "dry-files", "~> 1.1", ">= 1.1.0"
  spec.add_dependency "smp_tool", "~> 0.1", ">= 0.1.0"
  spec.add_dependency "zeitwerk", "~> 2.6", ">= 2.6.12"
end

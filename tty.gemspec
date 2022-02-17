# frozen_string_literal: true

require_relative "lib/tty/version"

Gem::Specification.new do |spec|
  spec.name          = "tty"
  spec.platform      = Gem::Platform::RUBY
  spec.version       = TTY::VERSION
  spec.authors       = ["Piotr Murach"]
  spec.email         = ["piotr@piotrmurach.com"]
  spec.description   = %q{A toolbox for developing modern command line applications the easy way.}
  spec.summary       = %q{A toolbox for developing modern command line applications the easy way.}
  spec.homepage      = "https://ttytoolkit.org"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["bug_tracker_uri"] = "https://github.com/piotrmurach/tty/issues"
  spec.metadata["changelog_uri"] = "https://github.com/piotrmurach/tty/blob/master/CHANGELOG.md"
  spec.metadata["documentation_uri"] = "https://www.rubydoc.info/gems/tty"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/piotrmurach/tty"

  spec.files         = Dir.glob("lib/**/*", File::FNM_DOTMATCH)
  spec.extra_rdoc_files = ["README.md", "CHANGELOG.md", "LICENSE.txt"]
  spec.bindir        = "exe"
  spec.executables   = ["teletype"]
  spec.require_paths = ["lib"]
  spec.required_ruby_version = ">= 2.3.0"

  spec.add_dependency "thor", "~> 1.2.0"
  spec.add_dependency "bundler", "~> 2.0"
  spec.add_dependency "tty-file", "~> 0.10"
  spec.add_dependency "tty-which", "~> 0.4"

  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", ">= 3.0"
  spec.add_development_dependency "timecop", "~> 0.9"
end

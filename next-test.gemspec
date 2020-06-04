require_relative 'lib/next/test/version'

Gem::Specification.new do |spec|
  spec.name          = "next-test"
  spec.version       = Next::Test::VERSION
  spec.authors       = ["Zachery Hostens"]
  spec.email         = ["zacheryph@gmail.com"]

  spec.summary       = %q{display ruby-next broken with packaged jruby app}
  spec.description   = %q{ditto}
  spec.homepage      = "https://github.com/zacheryph/next-test"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/zacheryph/next-test"
  spec.metadata["changelog_uri"] = "https://github.com/zacheryph/next-test"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end

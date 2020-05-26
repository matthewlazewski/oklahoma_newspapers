require_relative 'lib/oklahoma_newspapers/version'

Gem::Specification.new do |spec|
  spec.name          = "oklahoma_newspapers"
  spec.version       = OklahomaNewspapers::VERSION
  spec.authors       = ["matthewlazewski"]
  spec.email         = ["matthew.lazewski@gmail.com"]

  spec.summary       = "A quick history of some historical Oklahoma news publications"
  spec.description   = "A quick history of some historical Oklahoma news publications"
  spec.homepage      =  "https://github.com/matthewlazewski/oklahoma_newspapers"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/matthewlazewski/oklahoma_newspapers"
  spec.metadata["changelog_uri"] = "https://github.com/matthewlazewski/oklahoma_newspapers"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end

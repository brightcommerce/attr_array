require "./lib/attr_array/version"

Gem::Specification.new do |gem|
  gem.name        = "attr_array"
  gem.version     = AttrArray::Version::Compact
  gem.summary     = AttrArray::Version::Summary
  gem.description = AttrArray::Version::Description
  gem.authors     = AttrArray::Version::Author
  gem.email       = AttrArray::Version::Email
  gem.homepage    = AttrArray::Version::Homepage
  gem.license     = AttrArray::Version::License
  gem.metadata    = AttrArray::Version::Metadata
  gem.platform    = Gem::Platform::RUBY

  gem.required_ruby_version = '>= 2.3'
  gem.require_paths = ["lib"]
  gem.files = Dir[
    "{lib}/**/*",
    "UNLICENSED.md",
    "CHANGELOG.md",
    "README.md"
  ]

  gem.add_runtime_dependency 'activerecord', '>= 5.1.4'
  gem.add_runtime_dependency 'activesupport', '>= 5.1.4'
end

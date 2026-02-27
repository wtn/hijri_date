# frozen_string_literal: true

require_relative 'lib/hijri_date/version'

Gem::Specification.new do |spec|
  spec.name = 'hijri_date'
  spec.version = HijriDate::VERSION
  spec.authors = ['Murtaza Gulamali']
  spec.email = ['mygulamali@gmail.com']

  spec.summary = 'Hijri date object'
  spec.description = 'Manage Islamic Hijri dates.'
  spec.homepage = 'https://github.com/mygulamali/hijri_date'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.7.0'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ Gemfile .gitignore test/])
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end

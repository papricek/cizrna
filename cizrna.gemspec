# frozen_string_literal: true

require_relative 'lib/cizrna/version'

Gem::Specification.new do |spec|
  spec.name = 'cizrna'
  spec.version = Cizrna::VERSION
  spec.authors = [ 'Papricek' ]
  spec.email = [ 'patrikjira@gmail.com' ]

  spec.summary = 'Find company contact information using LLM with Google Search'
  spec.description = 'Cizrna finds company contact details (phone, email) for executives via Gemini API with Google Search grounding.'
  spec.homepage = 'https://github.com/papricek/cizrna'
  spec.required_ruby_version = '>= 3.2.0'

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/papricek/cizrna'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ Gemfile .gitignore])
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = [ 'lib' ]

  spec.add_dependency 'ruby_llm', '>= 2.0'
end

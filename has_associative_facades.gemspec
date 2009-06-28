# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{has_associative_facades}
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["C. Jason Harrelson"]
  s.date = %q{2009-06-28}
  s.description = %q{A Rails gem that creates getters and setters for associated object's attributes to aid in not breaking Demeter's Law.}
  s.email = ["jason@lookforwardwnterprises.com"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc"]
  s.files = ["History.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc", "Rakefile", "has_associative_facades.gemspec", "lib/has_associative_facades.rb", "lib/has_associative_facades/acts_methods.rb", "lib/has_associative_facades/instance_methods.rb", "script/console", "script/destroy", "script/generate", "spec/has_associative_facades_spec.rb", "spec/spec.opts", "spec/spec_helper.rb", "tasks/rspec.rake"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/midas/has_associative_facades/tree/master}
  s.post_install_message = %q{PostInstall.txt}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{has_associative_facades}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{A Rails gem that creates getters and setters for associated object's attributes to aid in not breaking Demeter's Law.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<newgem>, [">= 1.3.0"])
      s.add_development_dependency(%q<hoe>, [">= 1.8.0"])
    else
      s.add_dependency(%q<newgem>, [">= 1.3.0"])
      s.add_dependency(%q<hoe>, [">= 1.8.0"])
    end
  else
    s.add_dependency(%q<newgem>, [">= 1.3.0"])
    s.add_dependency(%q<hoe>, [">= 1.8.0"])
  end
end

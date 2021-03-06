#
# Copyright 2015-2016, Noah Kantrowitz
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'poise_boiler/version'

Gem::Specification.new do |spec|
  spec.name = 'poise-boiler'
  spec.version = PoiseBoiler::VERSION
  spec.authors = ['Noah Kantrowitz']
  spec.email = %w{noah@coderanger.net}
  spec.description = 'Boilerplate-reduction helpers for Poise/Halite-style gemss.'
  spec.summary = spec.description
  spec.homepage = 'https://github.com/poise/poise-boiler'
  spec.license = 'Apache 2.0'
  spec.metadata['halite_ignore'] = 'true'

  spec.files = `git ls-files`.split($/)
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = %w{lib}

  # Development gems
  spec.add_dependency 'bundler' # Used for Bundler.load_gemspec
  spec.add_dependency 'rake', '>= 10.4', '< 12.0'
  spec.add_dependency 'travis', '~> 1.8', '>= 1.8.1'
  spec.add_dependency 'yard', '~> 0.8'
  spec.add_dependency 'yard-classmethods', '~> 1.0'
  spec.add_dependency 'halite', '~> 1.2' # This is a circular dependency
  spec.add_dependency 'mixlib-shellout', '>= 1.4', '< 3.0' # Chef 11 means shellout 1.4 :-(
  spec.add_dependency 'pry'
  spec.add_dependency 'pry-byebug'
  spec.add_dependency 'git', '~> 1.2'

  # Test gems
  spec.add_dependency 'rspec', '~> 3.2'
  spec.add_dependency 'rspec-its', '~> 1.2'
  spec.add_dependency 'chefspec', '~> 5.0'
  spec.add_dependency 'fuubar', '~> 2.0'
  spec.add_dependency 'simplecov', '~> 0.9'
  spec.add_dependency 'foodcritic', '~> 7.0'

  # Integration gems
  # https://github.com/test-kitchen/test-kitchen/issues/922
  spec.add_dependency 'test-kitchen', '~> 1.7', '>= 1.7.1'
  spec.add_dependency 'kitchen-vagrant'
  spec.add_dependency 'vagrant-wrapper'
  spec.add_dependency 'kitchen-docker', '>= 2.6.0.rc.0'
  spec.add_dependency 'kitchen-sync', '~> 2.1'
  spec.add_dependency 'poise-profiler', '~> 1.0'

  # Windows integration gems
  spec.add_dependency 'kitchen-ec2', '~> 1.0'
  spec.add_dependency 'winrm', '~> 2.0'
  spec.add_dependency 'winrm-fs', '~> 1.0'

  # Travis gems
  spec.add_dependency 'codeclimate-test-reporter', '~> 0.4'
  spec.add_dependency 'codecov', '~> 0.0', '>= 0.0.2'

  # Development dependencies (yo dawg)
  spec.add_development_dependency 'rspec-command', '~> 1.0'
  spec.add_development_dependency 'kitchen-rackspace', '~> 0.20'
end

desc 'Checks Gemfile.lock for vulnerable gem versions'

namespace :bundler do
  task :audit do
    require 'bundler/audit/cli'
    Bundler::Audit::CLI.start ['check', '--update', '--ignore', 'CVE-2015-9284']
  end
end

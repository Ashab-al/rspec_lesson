require_relative '../lib/exchanger'

RSpec.configure do |config|
  config.example_status_persistence_file_path = 'spec/specs.txt'
  # config.define_derived_metadata(file_path: /exhanger\/utils/) do |meta|
    # meta[:fast] = true
  # end

  # config.filter_run_excluding :windows_only unless RUBY_PLATFORM.match(/mingw/i)
end

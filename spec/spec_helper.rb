require 'ostruct'
require 'hto'

RSpec.configure do |config|
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
  config.fail_fast = true
end
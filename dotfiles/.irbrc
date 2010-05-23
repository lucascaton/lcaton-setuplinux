if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
  require 'logger'
  RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
end

require 'rubygems'
require 'hirb'
Hirb.enable :pager => false
Hirb.enable :formatter => false

# begin
#   require 'wirble'
#   Wirble.init
#   Wirble.colorize
#   puts "Wirble enabled."
# rescue LoadError => err
#   warn "Couldn't load Wirble: #{err}"
# end

# require 'ap'

require "rubygems"
require "rspec"
require "httparty"
require "pry-debugger"

PROJECT_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..')).freeze
$LOAD_PATH << File.join(PROJECT_ROOT, 'lib')

require "connection"
require "client"
require "representer"
require "representation"
require "representations/election"
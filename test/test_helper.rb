require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'ruby-debug'
require 'mocha'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require decoder'

class Test::Unit::TestCase
end

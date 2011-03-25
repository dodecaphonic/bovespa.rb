$: << File.join(File.dirname(__FILE__), '..', 'lib')

require 'bovespa'

module Bovespa
  module Test
    Fixtures = {
      'invalid' => File.join(File.dirname(__FILE__), 'fixtures', 'invalid.html'),
      'vale5' => File.join(File.dirname(__FILE__), 'fixtures', 'vale5.html')
    }
  end

end

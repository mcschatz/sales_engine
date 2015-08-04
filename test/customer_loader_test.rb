require 'minitest/autorun'
require 'minitest/pride'
require './lib/customer_loader'


class FileIo < Minitest::Test

  def test_it_can_load_a_file
    sample = FileIO.new
    assert sample.load_file('./test/fixtures/sample_customers.csv')
  end
end
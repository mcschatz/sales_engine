require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/merchant_repository'

class MerchantRepositoryTest < Minitest::Test

	def test_it_loads_merchants
		sample = MerchantRepository.new('./test/fixtures/sample_merchants.csv')
		assert_equal 10, sample.merchants.count
	end


end
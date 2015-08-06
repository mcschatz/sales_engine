require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/merchant_repository'

class MerchantRepositoryTest < Minitest::Test

  def setup
    merchant1 = Merchant.new({id: '1', name: 'Schroeder-Jerde', created_at: '2012-03-27 14:53:59 UTC', updated_at: '2012-03-27 14:53:59 UTC'}, self)
    merchant2 = Merchant.new({id: '2', name: 'Timothy-Bigsby', created_at: '2012-02-11 13:43:29 UTC', updated_at: '2011-06-27 14:53:59 UTC'}, self)
    @mr = MerchantRepository.new([merchant1, merchant2])
  end

	def test_it_instantiates_an_empty_array
		sample = MerchantRepository.new([])
		assert_equal 0, sample.merchants.count
	end

  def test_it_hold_one_merchant
    sample = MerchantRepository.new(["hello jeff"])
    assert_equal 1, sample.merchants.count
  end

  def test_it_can_hold_two_merchants
    assert_equal 2, @mr.merchants.count
  end

  def test_it_can_put_all_merchants
    assert_equal 2, @mr.all.count
  end

  def test_it_can_find_a_random_merchant
    assert @mr.random
  end

  def test_it_can_find_a_merchant_by_name
    assert_equal "Timothy-Bigsby", @mr.find_by_name("Timothy-Bigsby").name
  end

  def test_it_can_find_a_merchant_by_id
    assert_equal '2', @mr.find_by_id("2").id
  end

  def test_it_can_find_a_merchant_by_created_at
    assert_equal '2012-02-11 13:43:29 UTC', @mr.find_by_created_at('2012-02-11 13:43:29 UTC').created_at
  end

  def test_it_can_find_a_merchant_by_updated_at
    assert_equal '2011-06-27 14:53:59 UTC', @mr.find_by_updated_at('2011-06-27 14:53:59 UTC').updated_at
  end

  def test_it_can_find_all_merchants_by_name
    assert_equal 1, @mr.find_all_by_name("Timothy-Bigsby").count
  end

  def test_it_can_find_all_merchants_by_id
    assert_equal 1, @mr.find_all_by_id("2").count
  end

  def test_it_can_find_all_merchants_by_created_at
    assert_equal 1, @mr.find_all_by_created_at('2012-02-11 13:43:29 UTC').count
  end

  def test_it_can_find_all_merchants_by_updated_at
    assert_equal 1, @mr.find_all_by_updated_at('2011-06-27 14:53:59 UTC').count
  end
end
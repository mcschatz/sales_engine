require_relative 'test_helper'
require './lib/merchant_repository'
require './lib/sales_engine'

class MerchantRepositoryTest < Minitest::Test
  attr_reader :mr

  def setup
    sample = SalesEngine.new('test/fixtures')
    sample.startup
    @mr = sample.merchant_repository
  end

	def test_it_instantiates_all_customers
		assert_equal 11, mr.merchants.count
	end

  def test_it_can_put_all_merchants
    assert_equal 11, mr.all.count
  end

  def test_it_can_find_a_random_merchant
    assert mr.random
  end

  def test_it_is_a_member_of_the_merchant_class
    assert_equal Merchant, mr.find_by_name("Person K").class
    assert_equal Merchant, mr.find_by_id(2).class
  end

  def test_it_can_find_a_merchant_by_name
    assert_equal "Person B", mr.find_by_name("Person B").name
  end

  def test_it_can_find_a_merchant_case_insensitive
    assert_equal "Person H", mr.find_by_name('Person H').name
  end

  def test_it_does_not_know_nicknames
    refute mr.find_by_name('tim')
  end

  def test_it_can_find_a_merchant_by_id
    assert_equal 2, mr.find_by_id(2).id
  end

  def test_it_can_find_all_merchants_by_name
    assert_equal 1, mr.find_all_by_name("Person D").count
  end

  def test_it_can_find_all_merchants_by_id
    assert_equal 1, mr.find_all_by_id(2).count
  end

  def test_it_can_return_an_empty_array_when_there_is_no_value
    assert_equal [], mr.find_all_by_name('')
    assert_equal [], mr.find_all_by_id('')
  end
end
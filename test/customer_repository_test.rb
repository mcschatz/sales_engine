require_relative 'test_helper'
require './lib/customer_repository'
require './lib/sales_engine'

class CustomerRepositoryTest < Minitest::Test
attr_reader :cr
  def setup
    sample = SalesEngine.new('test/fixtures')
    sample.startup
    @cr = sample.customer_repository
  end

  def test_it_instantiates_all_customers
    assert_equal 11, cr.customers.count
  end

  def test_it_can_put_all_customers
    assert_equal 11, cr.all.count
  end

  def test_it_can_find_a_random_customer
    assert cr.random
  end

  def test_it_is_a_member_of_the_customer_class
    assert_equal Customer, cr.find_by_first_name("Timothy").class
    assert_equal Customer, cr.find_by_last_name("Bigsby").class
    assert_equal Customer, cr.find_by_id(2).class
  end

  def test_it_can_find_a_customer_by_first_name
    assert_equal "Timothy", cr.find_by_first_name("Timothy").first_name
  end

  def test_it_can_find_a_customer_by_last_name
    assert_equal "Bigsby", cr.find_by_last_name("Bigsby").last_name
  end

  def test_it_can_find_a_customer_case_insensitive_first_name
    assert_equal "Timothy", cr.find_by_first_name('timothy').first_name
  end

  def test_it_can_find_a_customer_case_insensitive_last_name
    assert_equal "Bigsby", cr.find_by_last_name('bigsby').last_name
  end

  def test_it_does_not_know_first_nicknames
    refute cr.find_by_first_name('Tim')
  end

  def test_it_does_not_know_last_nicknames
    refute cr.find_by_last_name('Bigs')
  end

  def test_it_can_find_a_customer_by_id
    assert_equal 2, cr.find_by_id(2).id
  end

  def test_it_can_find_all_customers_by_first_name
    assert_equal 1, cr.find_all_by_first_name("Timothy").count
  end

  def test_it_can_find_all_customers_by_last_name
    assert_equal 1, cr.find_all_by_last_name("Bigsby").count
  end

  def test_it_can_find_all_customers_by_id
    assert_equal 1, cr.find_all_by_id(1).count
  end


  def test_it_can_return_an_empty_array_when_there_is_no_value
    assert_equal [], cr.find_all_by_first_name('')
    assert_equal [], cr.find_all_by_last_name('')
    assert_equal [], cr.find_all_by_id('')
  end
end
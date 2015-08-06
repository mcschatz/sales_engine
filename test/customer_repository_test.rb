require_relative 'test_helper'
require './lib/customer_repository'

class CustomerRepositoryTest < Minitest::Test
attr_reader :cr
  def setup
    customer1 = Customer.new({id: 1, first_name: 'Timothy', last_name: 'Bigsby', created_at: '2012-02-11 13:43:29 UTC', updated_at: '2011-06-27 14:53:59 UTC'}, self)
    customer2 = Customer.new({id: 2, first_name: 'Timothy', last_name: 'Bigsby', created_at: '2012-02-11 13:43:29 UTC', updated_at: '2011-06-27 14:53:59 UTC'}, self)
    customer3 = Customer.new({id: '', first_name: '', last_name: '', created_at: '', updated_at: ''}, self)
    @cr = CustomerRepository.new([customer1, customer2, customer3])
  end

  def test_it_instantiates_an_empty_array
    sample = CustomerRepository.new([])
    assert_equal 0, sample.customers.count
  end

  def test_it_hold_one_customer
    sample = CustomerRepository.new(["hello jeff"])
    assert_equal 1, sample.customers.count
  end

  def test_it_can_hold_three_customers
    assert_equal 3, cr.customers.count
  end

  def test_it_can_put_all_customers
    assert_equal 3, cr.all.count
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
    assert_equal 2, cr.find_all_by_first_name("Timothy").count
  end

  def test_it_can_find_all_customers_by_last_name
    assert_equal 2, cr.find_all_by_last_name("Bigsby").count
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
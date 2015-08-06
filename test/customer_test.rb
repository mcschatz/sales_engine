require_relative 'test_helper'
require './lib/customer'

class CustomerTest < Minitest::Test
attr_reader :customer
  def setup
    @customer = Customer.new({id: '2', first_name: 'Timothy', last_name: 'Bigsby', created_at: '2012-02-11 13:43:29 UTC', updated_at: '2011-06-27 14:53:59 UTC'}, self)
  end

  def test_the_customer_has_an_id_attribute
    assert customer.id
  end

  def test_the_customer_has_a_first_name_attribute
    assert customer.first_name
  end

  def test_the_customer_has_a_last_name_attribute
    assert customer.last_name
  end

  def test_the_customer_has_a_created_at_attribute
    assert customer.created_at
  end

  def test_the_customer_has_an_updated_at_attribute
    assert customer.updated_at
  end
end

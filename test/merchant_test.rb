require_relative 'test_helper'
require './lib/merchant'

class MerchantTest < Minitest::Test
attr_reader :merchant
  def setup
    @merchant = Merchant.new({id: '2', name: 'Timothy-Bigsby',
      created_at: '2012-02-11 13:43:29 UTC', updated_at: '2011-06-27 14:53:59 UTC'}, self)
  end

  def test_the_merchant_has_an_id_attribute
    assert merchant.id
  end

  def test_the_merchant_has_a_name_attribute
    assert merchant.name
  end

  def test_the_merchant_has_a_created_at_attribute
    assert merchant.created_at
  end

  def test_the_merchant_has_an_updated_at_attribute
    assert merchant.updated_at
  end
end

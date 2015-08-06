require_relative 'test_helper'
require './lib/invoice_item'

class InvoiceItemTest < Minitest::Test
attr_reader :invoice_item
  def setup
    @invoice_item = InvoiceItem.new({id: 1, item_id: 539, invoice_id: 1, quantity: 5, unit_price: 10000, created_at: '2012-03-27 14:54:09 UTC', updated_at: '2012-03-27 14:54:09 UTC'}, self)
  end

  def test_the_merchant_has_an_id_attribute
    assert invoice_item.id
  end

  def test_the_merchant_has_an_item_id_attribute
    assert invoice_item.item_id
  end

  def test_the_merchant_has_an_invoice_id_attribute
    assert invoice_item.invoice_id
  end

  def test_the_merchant_has_a_quantity_attribute
    assert invoice_item.quantity
  end

  def test_the_merchant_has_an_unit_price_attribute
    assert invoice_item.unit_price
  end

  def test_the_merchant_has_a_created_at_attribute
    assert invoice_item.created_at
  end

  def test_the_merchant_has_an_updated_at_attribute
    assert invoice_item.updated_at
  end
end
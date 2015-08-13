require_relative 'test_helper'
require './lib/sales_engine'
require './lib/invoice_item_repository'
require 'date'
require 'bigdecimal'

class InvoiceItemRepositoryTest < Minitest::Test
attr_reader :iir
  def setup
    sample = SalesEngine.new('test/fixtures')
    sample.startup
    @iir = sample.invoice_item_repository
  end

  def test_it_instantiates_all_invoice_items
    assert_equal 15, iir.invoice_items.count
  end

  def test_it_can_put_all_invoice_items
    assert_equal 15, iir.all.count
  end

  def test_it_can_find_a_random_invoice_item
    assert iir.random
  end

  def test_it_is_a_member_of_the_invoice_item_class
    assert_equal InvoiceItem, iir.find_by_id(1).class
    assert_equal InvoiceItem, iir.find_by_item_id(4).class
    assert_equal InvoiceItem, iir.find_by_invoice_id(1).class
    assert_equal InvoiceItem, iir.find_by_quantity(5).class
  end

  def test_it_can_find_an_invoice_item_by_id
    assert_equal 1, iir.find_by_id(1).id
  end

  def test_it_returns_nil_for_a_negative_number
    assert_equal nil, iir.find_by_id(-1)
  end

  def test_it_can_find_an_invoice_item_by_item_id
    assert_equal 6, iir.find_by_item_id(6).item_id
  end

  def test_it_can_find_an_invoice_item_by_invoice_id
    assert_equal 1, iir.find_by_invoice_id(1).invoice_id
  end

  #put in note for no id

  def test_it_can_find_an_invoice_item_by_quantity
    assert_equal 5, iir.find_by_quantity(5).quantity
  end

  def test_it_can_find_an_invoice_item_by_unit_price
    assert iir.find_by_unit_price(0.10)
  end

  def test_it_can_find_all_invoice_items_by_id
    assert_equal 1, iir.find_all_by_id(2).count
  end

  def test_it_can_find_all_invoice_items_by_item_id
    assert_equal 1, iir.find_all_by_item_id(8).count
  end

  def test_it_can_find_all_invoice_items_by_invoice_id
    assert_equal 1, iir.find_all_by_invoice_id(9).count
  end

  def test_it_can_find_all_invoice_items_by_unit_price
    assert_equal 1, iir.find_all_by_unit_price(0.30).count
  end

  def test_it_can_return_an_empty_array_when_there_is_no_value
    assert_equal [], iir.find_all_by_id('')
    assert_equal [], iir.find_all_by_item_id('')
    assert_equal [], iir.find_all_by_invoice_id('')
    assert_equal [], iir.find_all_by_quantity('')
    assert_equal [], iir.find_all_by_unit_price('')
  end
end
require_relative 'test_helper'
require './lib/invoice_item_repository'

class InvoiceItemRepositoryTest < Minitest::Test
attr_reader :iir
  def setup
    invoice_item1 = InvoiceItem.new({id: 1, item_id: 539, invoice_id: 1, quantity: 5, unit_price: 10000, created_at: '2012-03-27 14:54:09 UTC', updated_at: '2012-03-27 14:54:09 UTC'}, self)
    invoice_item2 = InvoiceItem.new({id: 2, item_id: 539, invoice_id: 1, quantity: 5, unit_price: 10000, created_at: '2012-03-27 14:54:09 UTC', updated_at: '2012-03-27 14:54:09 UTC'}, self)
    invoice_item3 = InvoiceItem.new({id: '', item_id: '', invoice_id: '', quantity: '', unit_price: '', created_at: '', updated_at: ''}, self)
    @iir = InvoiceItemRepository.new([invoice_item1, invoice_item2, invoice_item3])
  end

  def test_it_instantiates_an_empty_array
    sample = InvoiceItemRepository.new([])
    assert_equal 0, sample.invoice_items.count
  end

  def test_it_hold_one_invoice_item
    sample = InvoiceItemRepository.new(["hello jeff"])
    assert_equal 1, sample.invoice_items.count
  end

  def test_it_can_hold_three_invoice_items
    assert_equal 3, iir.invoice_items.count
  end

  def test_it_can_put_all_invoice_items
    assert_equal 3, iir.all.count
  end

  def test_it_can_find_a_random_invoice_item
    assert iir.random
  end

  def test_it_is_a_member_of_the_invoice_item_class
    assert_equal InvoiceItem, iir.find_by_id(1).class
    assert_equal InvoiceItem, iir.find_by_item_id(539).class
    assert_equal InvoiceItem, iir.find_by_invoice_id(1).class
    assert_equal InvoiceItem, iir.find_by_quantity(5).class
    assert_equal InvoiceItem, iir.find_by_unit_price(10000).class
  end

  def test_it_can_find_an_invoice_item_by_id
    assert_equal 1, iir.find_by_id(1).id
  end

  #Negative number?

  def test_it_can_find_an_invoice_item_by_item_id
    assert_equal 539, iir.find_by_item_id(539).item_id
  end

  def test_it_can_find_an_invoice_item_by_invoice_id
    assert_equal 1, iir.find_by_invoice_id(1).invoice_id
  end

  def test_it_can_find_an_invoice_item_by_quantity
    assert_equal 5, iir.find_by_quantity(5).quantity
  end

  def test_it_can_find_an_invoice_item_by_unit_price
    assert_equal 10000, iir.find_by_unit_price(10000).unit_price
  end

  def test_it_can_find_all_invoice_items_by_id
    assert_equal 1, iir.find_all_by_id(2).count
  end

  def test_it_can_find_all_invoice_items_by_item_id
    assert_equal 2, iir.find_all_by_item_id(539).count
  end

  def test_it_can_find_all_invoice_items_by_invoice_id
    assert_equal 2, iir.find_all_by_invoice_id(1).count
  end

  def test_it_can_find_all_invoice_items_by_quantity
    assert_equal 2, iir.find_all_by_quantity(5).count
  end

  def test_it_can_find_all_invoice_items_by_unit_price
    assert_equal 2, iir.find_all_by_unit_price(10000).count
  end

  def test_it_can_return_an_empty_array_when_there_is_no_value
    assert_equal [], iir.find_all_by_id('')
    assert_equal [], iir.find_all_by_item_id('')
    assert_equal [], iir.find_all_by_invoice_id('')
    assert_equal [], iir.find_all_by_quantity('')
    assert_equal [], iir.find_all_by_unit_price('')
  end
end
require_relative 'test_helper'
require './lib/sales_engine'

class InvoiceItemRelationshipTest < Minitest::Test
attr_reader :iir

  def setup
    sample = SalesEngine.new('test/fixtures')
    sample.startup
    @iir = sample.invoice_item_repository
  end

  def test_it_can_find_a_single_invoice_items_invoice
    invoice_item = iir.find_by_id(1)
    invoice_item = invoice_item.invoice.created_at
    assert_equal "2012-03-25 09:54:09 UTC", invoice_item
  end

  def test_it_can_find_a_single_invoice_items_item
    item = iir.find_by_id(1)
    invoice_item = item.item.description
    assert_equal "Blue", invoice_item
  end
end
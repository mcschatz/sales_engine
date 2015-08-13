require_relative 'test_helper'
require './lib/sales_engine'

class InvoiceRelationshipTest < Minitest::Test
attr_reader :ir, :sample

  def setup
    @sample = SalesEngine.new('./test/fixtures')
    sample.startup
    @ir = sample.invoice_repository
  end

  def test_it_can_find_transaction_by_invoice_id
    invoice = ir.find_by_id(1)
    invoice1 = invoice.transactions
    assert_equal 1, invoice1.count
  end

  def test_it_can_find_invoice_items_by_invoice_id
    invoice = ir.find_by_id(1)
    invoice1 = invoice.invoice_items
    assert_equal 1, invoice1.count
  end

  def test_it_can_find_items_by_invoice_id
    invoice = ir.find_by_id(2)
    invoice1 = invoice.items
    assert_equal 1, invoice1.count
  end

  def test_it_can_find_a_merchants_invoice
    invoice = ir.find_by_id(1)
    invoice1 = invoice.merchant.name
    assert_equal 'Person A', invoice1
  end

  def test_it_can_find_a_customers_invoice
    invoice = ir.find_by_id(1)
    invoice1 = invoice.customer.first_name
    assert_equal 'Joey', invoice1
  end

  def test_it_can_create_an_invoice
    item = sample.item_repository.find_by_id(3)
    customer = sample.customer_repository.find_by_id(3)
    merchant = sample.merchant_repository.find_by_id(3)
    invoice = sample.invoice_repository.create(customer: customer, merchant: merchant, status: "shipped", items:[item])
    assert_equal invoice, sample.invoice_repository.all.last
  end

  def test_charge_creates_a_new_transaction
    invoice = ir.find_by_id(10)
    first_transaction_count = invoice.transactions.count
    invoice.charge(credit_card_number: "9123786549999675", credit_card_expiration_date: "11/22", result: "success")
    assert_equal first_transaction_count.next, invoice.transactions.count
  end
end
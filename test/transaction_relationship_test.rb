require_relative 'test_helper'
require './lib/sales_engine'

class TransactionRelationshipTest < Minitest::Test
attr_reader :tr

  def setup
    sample = SalesEngine.new('./test/fixtures')
    sample.startup
    @tr = sample.transaction_repository
  end

  def test_it_can_find_a_single_transactions_invoice
    transaction = tr.find_by_id(1)
    invoice     = transaction.invoice.created_at
    assert_equal '2012-03-25', invoice
  end

  def test_it_can_charge_a_transaction

  end
end


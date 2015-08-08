require_relative 'test_helper'
require './lib/sales_engine'

class TransactionRelationshipTest < Minitest::Test
attr_reader :tr

  def setup
    sample = SalesEngine.new('test/fixtures')
    sample.startup
    @tr = sample.transaction_repository
  end

  def test_it_can_find_a_transactions_invoices
    transaction = tr.find_by_id(1)
    invoice    = transaction.invoice
    assert invoice
  end

  #What happens if we ask for something that is not there
end


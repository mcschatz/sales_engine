require_relative 'test_helper'
require './lib/transaction_repository'
require './lib/sales_engine'

class TransactionRepositoryTest < Minitest::Test
attr_reader :tr
  def setup
    sample = SalesEngine.new('test/fixtures')
    sample.startup
    @tr = sample.transaction_repository
  end

  def test_it_instantiates_all_transactions
    assert_equal 15, tr.transactions.count
  end

  def test_it_can_put_all_transactions
    assert_equal 15, tr.all.count
  end

  def test_it_can_find_a_random_transaction
    assert tr.random
  end

  def test_it_is_a_member_of_the_transaction_class
    assert_equal Transaction, tr.find_by_id(1).class
    assert_equal Transaction, tr.find_by_invoice_id(2).class
    assert_equal Transaction, tr.find_by_credit_card_number('123').class
    assert_equal Transaction, tr.find_by_result("success").class
  end

  def test_it_can_find_a_transaction_by_id
    assert_equal 1, tr.find_by_id(1).id
  end

  def test_it_can_find_a_transaction_by_invoice_id
    assert_equal 2, tr.find_by_invoice_id(2).invoice_id
  end

  def test_it_can_find_a_transaction_by_credit_card_number
    assert_equal '123', tr.find_by_credit_card_number('123').credit_card_number
  end

  def test_it_can_find_a_transaction_by_result
    assert_equal 'failed', tr.find_by_result('failed').result
  end

  def test_it_can_find_all_transactions_by_id
    assert_equal 1, tr.find_all_by_id(1).count
  end

  def test_it_can_find_all_transactions_by_invoice_id
    assert_equal 1, tr.find_all_by_invoice_id(2).count
  end

  def test_it_can_find_all_transactions_by_credit_card_number
    assert_equal 1, tr.find_all_by_credit_card_number('123').count
  end

  def test_it_can_find_all_transactions_by_result
    assert_equal 13, tr.find_all_by_result('success').count
  end


  def test_it_can_return_an_empty_array_when_there_is_no_value
    assert_equal [], tr.find_all_by_id('')
    assert_equal [], tr.find_all_by_invoice_id('')
    assert_equal [], tr.find_all_by_credit_card_number('')
    assert_equal [], tr.find_all_by_result('')
  end
end
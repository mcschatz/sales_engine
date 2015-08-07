require_relative 'test_helper'
require './lib/transaction_repository'

class TransactionRepositoryTest < Minitest::Test
attr_reader :tr
  def setup
    transaction1 = Transaction.new({id: 1, invoice_id: 1, credit_card_number: 4654405418249630, credit_card_expiration_date: '10/15', result: 'success', created_at: '2012-03-27 14:54:09 UTC', updated_at: '2012-03-27 14:54:09 UTC'}, self)
    transaction2 = Transaction.new({id: 2, invoice_id: 2, credit_card_number: 4654405418249621, credit_card_expiration_date: '11/16', result: 'failed', created_at: '2011-09-24 13:59:05 UTC', updated_at: '2013-01-24 13:51:09 UTC'}, self)
    transaction3 = Transaction.new({id: '', invoice_id: '', credit_card_number: '', credit_card_expiration_date: '', result: '', created_at: '', updated_at: ''}, self)
    transaction4 = Transaction.new({id: 4, invoice_id: 2, credit_card_number: 4654405418249621, credit_card_expiration_date: '11/16', result: 'success', created_at: '2011-09-24 13:59:05 UTC', updated_at: '2013-01-24 13:51:09 UTC'}, self)
    @tr = TransactionRepository.new([transaction1, transaction2, transaction3, transaction4], self)
  end

  def test_it_instantiates_an_empty_array
    sample = TransactionRepository.new([], self)
    assert_equal 0, sample.transactions.count
  end

  def test_it_hold_one_transaction
    sample = TransactionRepository.new(["hello jeff"], self)
    assert_equal 1, sample.transactions.count
  end

  def test_it_can_hold_four_transactions
    assert_equal 4, tr.transactions.count
  end

  def test_it_can_put_all_transactions
    assert_equal 4, tr.all.count
  end

  def test_it_can_find_a_random_transaction
    assert tr.random
  end

  def test_it_is_a_member_of_the_transaction_class
    assert_equal Transaction, tr.find_by_id(1).class
    assert_equal Transaction, tr.find_by_invoice_id(2).class
    assert_equal Transaction, tr.find_by_credit_card_number(4654405418249630).class
    assert_equal Transaction, tr.find_by_result("success").class
  end

  def test_it_can_find_a_transaction_by_id
    assert_equal 1, tr.find_by_id(1).id
  end

  def test_it_can_find_a_transaction_by_invoice_id
    assert_equal 2, tr.find_by_invoice_id(2).invoice_id
  end

  def test_it_can_find_a_transaction_by_credit_card_number
    assert_equal 4654405418249630, tr.find_by_credit_card_number(4654405418249630).credit_card_number
  end

  def test_it_can_find_a_transaction_by_result
    assert_equal 'failed', tr.find_by_result('failed').result
  end

  def test_it_can_find_all_transactions_by_id
    assert_equal 1, tr.find_all_by_id(1).count
  end

  def test_it_can_find_all_transactions_by_invoice_id
    assert_equal 2, tr.find_all_by_invoice_id(2).count
  end

  def test_it_can_find_all_transactions_by_credit_card_number
    assert_equal 2, tr.find_all_by_credit_card_number(4654405418249621).count
  end

  def test_it_can_find_all_transactions_by_result
    assert_equal 2, tr.find_all_by_result('success').count
  end


  def test_it_can_return_an_empty_array_when_there_is_no_value
    assert_equal [], tr.find_all_by_id('')
    assert_equal [], tr.find_all_by_invoice_id('')
    assert_equal [], tr.find_all_by_credit_card_number('')
    assert_equal [], tr.find_all_by_result('')
  end
end
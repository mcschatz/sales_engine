require_relative 'test_helper'
require './lib/transaction'

class TransactionTest < Minitest::Test
attr_reader :transaction
  def setup
    @transaction = Transaction.new({id: 1, invoice_id: 1, credit_card_number: 4654405418249630, credit_card_expiration_date: '10/15', result: 'success', created_at: '2012-03-27 14:54:09 UTC', updated_at: '2012-03-27 14:54:09 UTC'}, self)
  end

  def test_the_transaction_has_an_id_attribute
    assert transaction.id
  end

  def test_the_transaction_has_an_invoice_id_attribute
    assert transaction.invoice_id
  end

  def test_the_transaction_has_a_credit_card_number_attribute
    assert transaction.credit_card_number
  end

  def test_the_transaction_has_a_credit_card_expiration_date_attribute
    assert transaction.credit_card_expiration_date
  end

  def test_the_transaction_has_a_result_attribute
    assert transaction.result
  end

  def test_the_transaction_has_a_created_at_attribute
    assert transaction.created_at
  end

  def test_the_transaction_has_an_updated_at_attribute
    assert transaction.updated_at
  end
end
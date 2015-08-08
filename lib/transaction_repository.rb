require_relative 'transaction_loader'
require_relative 'transaction'

class TransactionRepository
 attr_accessor :transactions
 attr_reader   :filename, :engine

  def initialize(transactions, engine)
    @transactions = transactions
    @engine       = engine
  end

  def add_transaction(row, repository)
    transactions << Transaction.new(row, self)
  end

  def all
    transactions
  end

  def random
    transactions.sample
  end

  def find_by_id(id)
    transactions.find {|transaction| transaction.id == id}
  end

  def find_by_invoice_id(id)
    transactions.find {|transaction| transaction.invoice_id == id}
  end

  def find_by_credit_card_number(number)
    transactions.find {|transaction| transaction.credit_card_number == number}
  end

  def find_by_result(result)
    transactions.find {|transaction| transaction.result == result}
  end

  def find_all_by_id(id)
    if id != ''
      transactions.find_all {|transaction| transaction.id == id}
    else
      []
    end
  end

  def find_all_by_invoice_id(id)
    if id != ''
      transactions.find_all {|transaction| transaction.invoice_id == id}
    else
      []
    end
  end

  def find_all_by_credit_card_number(number)
    if number != ''
      transactions.find_all {|transaction| transaction.credit_card_number == number}
    else
      []
    end
  end

  def find_all_by_result(result)
    if result != ''
      transactions.find_all {|transaction| transaction.result == result}
    else
      []
    end
  end

  def find_invoice_by_id(id)
    engine.find_invoice_by_id(id)
  end
end
require_relative 'transaction_loader'
require_relative 'transaction'

class TransactionRepository
 attr_accessor :transactions
 attr_reader   :filename

  def initialize(transactions)
    @transactions = transactions
  end

  def add_customer(row, repository)
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

   def find_by_credit_card_expiration_date(date)
    transactions.find {|transaction| transaction.credit_card_expiration_date == date}
  end

  def find_by_result(result)
    transactions.find {|transaction| transaction.result == result}
  end

  def find_by_created_at(date)
    transactions.find {|transaction| transaction.created_at == date}
  end

  def find_by_updated_at(date)
    transactions.find {|transaction| transaction.updated_at == date}
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

  def find_all_by_credit_card_expiration_date(date)
    if date != ''
      transactions.find_all {|transaction| transaction.credit_card_expiration_date == date}
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

  def find_all_by_created_at(date)
    if date != ''
      transactions.find_all {|transaction| transaction.created_at == date}
    else
      []
    end
  end

  def find_all_by_updated_at(date)
    if date != ''
      transactions.find_all {|transaction| transaction.updated_at == date}
    else
      []
    end
  end
end
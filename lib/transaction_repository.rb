require_relative 'transaction_loader'
require_relative 'transaction'

class TransactionRepository
 attr_accessor :transactions
 attr_reader   :filename, :engine

  def initialize(transactions, engine)
    @transactions ||= transactions
    @engine       ||= engine
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

  def charge(payment_data, invoice_id)
    credit_card_number = payment_data[:credit_card_number]
    credit_card_expiration_date = payment_data[:credit_card_expiration_date]
    result = payment_data[:result]
    new_transaction = Transaction.new(
      {id: next_id,
       invoice_id: invoice_id,
       credit_card_number: credit_card_number,
       credit_card_expiration_date: credit_card_expiration_date,
       result: result,
       created_at: Time.now.strftime("%c %d, %Y"),
       updated_at: Time.now.strftime("%c %d, %Y")},
       self)
   transactions << new_transaction
  end

  def next_id
    if transactions.last.nil?
      1
    else
      transactions.last.id.next
    end
  end

  def inspect
    "#<#{self.class} #{@transactions.size} rows>"
  end
end
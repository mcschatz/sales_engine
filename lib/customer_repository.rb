require_relative 'customer_loader'
require_relative 'customer'

class CustomerRepository
 attr_accessor :customers
 attr_reader :filename, :engine

  def initialize(customers, engine)
    @customers = customers
    @engine    = engine
  end

  def add_customer(row, repository)
    customers << Customer.new(row, self)
  end

  def all
    customers
  end

  def random
    customers.sample
  end

  def find_by_id(id)
    customers.find {|customer| customer.id == id}
  end

  def find_by_first_name(name)
    customers.find {|customer| customer.first_name.downcase == name.downcase}
  end

  def find_by_last_name(name)
    customers.find {|customer| customer.last_name.downcase == name.downcase}
  end

  def find_all_by_id(id)
    if id != ''
      customers.find_all {|customer| customer.id == id}
    else
      []
    end
  end

  def find_all_by_first_name(name)
    if name != ''
      customers.find_all {|customer| customer.first_name == name}
    else
      []
    end
  end

  def find_all_by_last_name(name)
    if name != ''
      customers.find_all {|customer| customer.last_name == name}
    else
      []
    end
  end

  def find_invoices_by_customer_id(id)
    engine.find_all_invoices_by_customer_id(id)
  end

  def find_all_transactions_by_invoice_id(id)
    engine.find_all_transactions_by_invoice_id(id)
  end
end

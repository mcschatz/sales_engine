require_relative 'invoice_loader'
require_relative 'invoice'

class InvoiceRepository
 attr_accessor :invoices
 attr_reader :filename, :engine

  def initialize(invoices, engine)
    @invoices = invoices
    @engine   = engine
  end

  def add_invoice(row, repository)
    invoices << Invoice.new(row, self)
  end

  def all
    invoices
  end

  def random
    invoices.sample
  end

  def find_by_id(id)
    invoices.find {|invoice| invoice.id == id}
  end

  def find_by_customer_id(id)
    invoices.find {|invoice| invoice.customer_id == id}
  end

  def find_by_merchant_id(id)
    invoices.find {|invoice| invoice.merchant_id == id}
  end

  def find_by_status(status)
    invoices.find {|invoice| invoice.status == status}
  end

  def find_all_by_id(id)
    if id != ''
      invoices.find_all {|invoice| invoice.id == id}
    else
      []
    end
  end

  def find_all_by_customer_id(id)
    if id != ''
      invoices.find_all {|invoice| invoice.customer_id == id}
    else
      []
    end
  end

  def find_all_by_merchant_id(id)
    if id != ''
      invoices.find_all {|invoice| invoice.merchant_id == id}
    else
      []
    end
  end

  def find_all_by_status(status)
    if status != ''
      invoices.find_all {|invoice| invoice.status == status}
    else
      []
    end
  end

  def find_transactions_by_invoice_id(id)
    engine.find_all_transactions_by_invoice_id(id)
  end

  def find_invoice_items_by_invoice_id(id)
    engine.find_all_invoice_items_by_invoice_id(id)
  end

  def find_merchant_by_id(id)
    engine.find_merchant_by_id(id)
  end
end

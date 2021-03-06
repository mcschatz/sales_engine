require_relative 'invoice_loader'
require_relative 'invoice'

class InvoiceRepository
 attr_accessor :invoices
 attr_reader :filename, :engine

  def initialize(invoices, engine)
    @invoices ||= invoices
    @engine   ||= engine
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

  def find_items_by_item_id(id)
    engine.find_item_by_id(id)
  end

  def find_customer_by_customer_id(id)
    engine.find_customer_by_id(id)
  end

  def find_merchant_by_merchant_id(id)
    engine.find_merchant_by_id(id)
  end

  def create(invoice_data)
    customer    = invoice_data[:customer]
    merchant    = invoice_data[:merchant]
    status      = invoice_data[:status]
    items       = invoice_data[:items]
    new_invoice = Invoice.new({id: next_invoice_id,
                               customer_id: customer.id,
                               merchant_id: merchant.id,
                               status: status,
                               created_at: Time.now.strftime("%c %d, %Y"),
                               updated_at: Time.now.strftime("%c %d, %Y")},
                               self)
    invoices << new_invoice
    engine.create_invoice_items(items, new_invoice.id)
    new_invoice
  end

  def next_invoice_id
    if invoices.last.nil?
      1
    else
      invoices.last.id.next
    end
  end

  def charge(payment_data, id)
    engine.charge(payment_data,id)
  end

  def inspect
    "#<#{self.class} #{@invoices.size} rows>"
  end
end

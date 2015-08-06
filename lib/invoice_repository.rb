require_relative 'invoice_loader'
require_relative 'invoice'

class InvoiceRepository
 attr_accessor :invoices
 attr_reader :filename

  def initialize(invoices)
    @invoices = invoices
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

  def find_by_name(name)
    invoices.find {|invoice| invoice.name.downcase == name.downcase}
  end

  def find_by_id(id)
    invoices.find {|invoice| invoice.id == id}
  end

  def find_by_created_at(date)
    invoices.find {|invoice| invoice.created_at == date}
  end

  def find_by_updated_at(date)
    invoices.find {|invoice| invoice.updated_at == date}
  end

  def find_all_by_name(name)
    if name != ''
      invoices.find_all {|invoice| invoice.name == name}
    else
      []
    end
  end

  def find_all_by_id(id)
    if id != ''
      invoices.find_all {|invoice| invoice.id == id}
    else
      []
    end
  end

  def find_all_by_created_at(date)
    if date != ''
      invoices.find_all {|invoice| invoice.created_at == date}
    else
      []
    end
  end

  def find_all_by_updated_at(date)
    if date != ''
      invoices.find_all {|invoice| invoice.updated_at == date}
    else
      []
    end
  end

end

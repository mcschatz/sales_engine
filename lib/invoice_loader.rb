require 'CSV'
require_relative 'invoice'

class InvoiceLoader

  def initialize(repository, filename)
    @repository = repository
    @filename   = filename
  end

  def parse_invoices
    CSV.foreach(@filename, :headers => true, :header_converters => :symbol,
    :converters => :numeric) do |row|
      @repository.add_invoice(row, @repository)
    end
  end
end
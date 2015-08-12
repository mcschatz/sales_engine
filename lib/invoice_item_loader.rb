require 'CSV'
require_relative 'invoice_item'

class InvoiceItemLoader

  def initialize(repository, filename)
    @repository = repository
    @filename   = filename
  end

  def parse
    CSV.foreach(@filename, :headers => true, :header_converters => :symbol, :converters => :numeric) do |row|
      @repository.add_invoice_item(row, @repository)
    end
  end
end
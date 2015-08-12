require 'bigdecimal'
require 'date'

class InvoiceItem
  attr_reader :id,
              :item_id,
              :invoice_id,
              :quantity,
              :unit_price,
              :created_at,
              :updated_at,
              :repository

  def initialize(row, repository)
    @id         = row[:id]
    @item_id    = row[:item_id]
    @invoice_id = row[:invoice_id]
    @quantity   = row[:quantity]
    @unit_price = BigDecimal.new(row[:unit_price])/100
    @created_at = Date.parse(row[:created_at])
    @updated_at = row[:updated_at]
    @repository = repository
  end

  def invoice
    repository.find_invoice_by_invoice_id(invoice_id)
  end

  def item
    repository.find_item_by_id(item_id)
  end

  def revenue
    quantity * unit_price
  end

  def successful_transactions
    invoice.map do |i|
      i.successful_transactions
    end
  end
end
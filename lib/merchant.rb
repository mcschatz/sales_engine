class Merchant
  attr_reader :id,
              :name,
              :created_at,
              :updated_at,
              :repository

  def initialize(row, repository)
    @id         = row[:id]
    @name       = row[:name]
    @created_at = row[:created_at]
    @updated_at = row[:updated_at]
    @repository = repository
  end

  def items
    repository.find_items_by_merchant_id(id)
  end

  def invoices
    repository.find_invoices_by_merchant_id(id)
  end

  def invoice_items
    ids = invoices.map do |invoice|
      invoice.id
    end
    ids.map do |id|
      repository.find_invoice_items_by_id(id)
    end
  end

  def revenue
    invoice_id = repository.successful_invoice_items(id)
    ii = repository.find_invoice_items_by_id(invoice_id)
    ii.reduce(0) do |revenue, ii|
      revenue += (ii.quantity * ii.unit_price)
    end
  end
end











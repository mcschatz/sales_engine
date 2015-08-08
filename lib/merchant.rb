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
    revenue = invoice_items.map.with_index do |item, index|
      (item[index].quantity) * (item[index].unit_price)
    end
    revenue.reduce
  end
end
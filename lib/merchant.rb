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

  def successful_invoice_items
    invoice_id = repository.successful_transactions(id)
    repository.find_invoice_items_by_id(invoice_id)
  end

  def revenue(date = nil)
    if date == nil
      successful_invoice_items.reduce(0) do |revenue, ii|
        revenue += (ii.quantity * ii.unit_price)
      end
    else
      successful_item_by_date(date).reduce(0) do |revenue, ii|
        revenue += (ii.quantity * ii.unit_price)
      end
    end
  end

  def items_sold
    successful_invoice_items.map do |item|
      item.quantity
    end
  end

  def successful_item_by_date(date)
    successful_invoice_items.map do |item|
      if item.created_at == date
        item
      end
    end
  end
end












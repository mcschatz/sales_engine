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

  def successful_invoices
    invoices.select do |invoice|
      invoice.successful_transactions
    end
  end

  def revenue(date = nil)
    if date == nil
      successful_invoices.map(&:revenue).reduce(0, :+)
    else
      successful_item_by_date(date).flatten.reduce(0, :+)
    end
  end

  def items_sold
    successful_invoices.map(&:items_sold)
  end

  def successful_item_by_date(date)
    successful_invoices.map do |invoice|
      invoice.date(date).map(&:revenue)
    end
  end

  def favorite_customer
    successful_invoices.map do |item|
      item.customer_id
    end
  end
end
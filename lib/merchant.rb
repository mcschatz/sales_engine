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
    invoices.map do |invoice|
      invoice.successful_transactions
    end
  end

  def revenue(date)
    if date
      results = successful_invoices.find_all {|invoice| invoice.on_date?(date)}
      results.map(&:revenue).reduce(0, :+)
    else
      successful_invoices.map(&:revenue).reduce(0, :+)
    end
  end

  def items_sold
    successful_invoices.map(&:items_sold)
  end

  def favorite_customer
    customers = successful_invoices.map do |invoice|
      invoice.customer
    end
    customers.find do |customer|
      customer.id == find_customer
    end
  end

  def find_customer
    id_count = Hash.new(0)
    successful_invoices.map do |invoice|
     id_count[invoice.customer_id] += 1
    end
    id_count.key(id_count.values.max)
  end

  def customers_with_pending_invoices
  end
end
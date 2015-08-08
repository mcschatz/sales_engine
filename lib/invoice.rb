class Invoice
  attr_reader :id,
              :customer_id,
              :merchant_id,
              :status,
              :created_at,
              :updated_at,
              :repository

  def initialize(row, repository)
    @id          = row[:id]
    @customer_id = row[:customer_id]
    @merchant_id = row[:merchant_id]
    @status      = row[:status]
    @created_at  = row[:created_at]
    @updated_at  = row[:updated_at]
    @repository  = repository
  end

  def transactions #a collection of transactions
    repository.find_transactions_by_invoice_id(id)
  end

  def invoice_items #a collections of associated invoiceitem objects
    repository.find_invoice_items_by_invoice_id(id)
  end

  def items #a collection of associated items by way of invoice items
  end

  def customer #an instance of customer associated with this object
  end

  def merchant #an instance of merchant associated wit this object
    repository.find_merchant_by_id(id)
  end
end
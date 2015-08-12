require 'date'

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
    @created_at  = Date.parse(row[:created_at]).strftime("%Y-%m-%d")
    @updated_at  = row[:updated_at]
    @repository  = repository
  end

  def transactions
    repository.find_transactions_by_invoice_id(id)
  end

  def invoice_items
    repository.find_invoice_items_by_invoice_id(id)
  end

  def items
    item_ids = invoice_items.map do |item|
      item.item_id
    end
    item_ids.map do |id|
      repository.find_items_by_item_id(id)
    end
  end

  def customer
    repository.find_customer_by_customer_id(customer_id)
  end

  def merchant
    repository.find_merchant_by_merchant_id(merchant_id)
  end

  def successful_transactions
    transactions.any?(&:successful?)
  end

  def revenue
    invoice_items.map(&:revenue).reduce(0, :+)
  end

  def items_sold
    invoice_items.map(&:quantity).reduce(0, :+)
  end

  def convert_created_at
    date = Date.parse(created_at)
    date.strftime("%Y-%m-%d")
  end

  def on_date?(date = nil)
    datum = date.strftime("%Y-%m-%d")
    convert_created_at == datum
  end

  def charge(payment_data)
    repository.charge(payment_data, id)
  end
end
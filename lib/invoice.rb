require 'pry'
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

  def transactions
    repository.find_transactions_by_invoice_id(id)
  end

  def invoice_items
    repository.find_invoice_items_by_invoice_id(id)
  end

  def items
    ids = invoice_items.map do |item|
      item.id
    end
    ids.map do |id|
      repository.find_items_by_invoice_id(id)
    end
  end

  def customer
    repository.find_customer_by_id(id)
  end

  def merchant
    repository.find_merchant_by_id(id)
  end

  def successful_transactions
    transactions.any?(&:successful?)
  end

  def revenue
    invoice_items.map(&:revenue).reduce(0, :+)
  end

  def items_sold
    invoice_items.map do |item|
      item.quantity
    end
  end

  # def frequent_customer
  #   customer_id.map do |id|
  #     id.



  # end

  def date(date = nil)
    invoice_items.select do |item|
      item.created_at == date
    end
  end
end
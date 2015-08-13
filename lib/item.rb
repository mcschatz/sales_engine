require 'bigdecimal'
require 'date'

class Item
  attr_reader :id,
              :name,
              :description,
              :unit_price,
              :merchant_id,
              :created_at,
              :updated_at,
              :repository,
              :number_sold

  def initialize(row, repository)
    @id          = row[:id]
    @name        = row[:name]
    @description = row[:description]
    @unit_price  = BigDecimal.new(row[:unit_price])/100
    @merchant_id = row[:merchant_id]
    @created_at  = Date.parse(row[:created_at])
    @updated_at  = row[:updated_at]
    @repository  = repository
    @number_sold = items_sold

  end

  def merchant
    repository.find_merchant_by_id(merchant_id)
  end

  def invoice_items
    repository.find_invoice_items_by_id(id)
  end

  def successful_transactions
    invoice_items.select do |invoice_item|
      invoice_item.successful_transactions
    end
  end

  def revenue
    successful_transactions.map do |invoice|
      invoice.revenue
    end.reduce(0, :+)
  end

  def successful_invoice_items
    invoice_items.select do |invoice_item|
      invoice_item.item_id == id
    end
  end

  def items_sold
    invoices = invoice_items.map do |invoice_item|
      invoice_item.invoice
    end.uniq

    successful_invoices = invoices.select do |invoice|
      invoice.successful_transactions
    end

    successful_i_items = successful_invoices.flat_map do |invoice|
      invoice.invoice_items
    end

    relevant_i_items = successful_i_items.select do |invoice_item|
      invoice_item.item_id == id
    end

    total_items = relevant_i_items.reduce(0) do |result, invoice_item|
      result += invoice_item.quantity
      result
    end
    total_items
  end

  def best_day
    day_count = Hash.new(0)
    successful_transactions.map do |transaction|
      day_count[transaction.created_at] += 1
    end
    day = day_count.key(day_count.values.max)
    # Date.parse(day)
  end
end
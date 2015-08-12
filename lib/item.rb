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
              :items_sold

  def initialize(row, repository)
    @id          = row[:id]
    @name        = row[:name]
    @description = row[:description]
    @unit_price  = BigDecimal.new(row[:unit_price])/100
    @merchant_id = row[:merchant_id]
    @created_at  = Date.parse(row[:created_at])
    @updated_at  = row[:updated_at]
    @repository  = repository
    @items_sold  ||= items_sold
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
    invoice_items.map do |invoice_item|
      invoice_item.invoice
    end.select do |invoice|
      invoice.successful_transactions
    end.flat_map do |invoice|
      invoice.invoice_items
    end.select do |invoice_item|
      invoice_item.item_id == id
    end.reduce(0) do |result, invoice_item|
      result += invoice_item.quantity
      result
    end
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
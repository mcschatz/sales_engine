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
              :repository

  def initialize(row, repository)
    @id          = row[:id]
    @name        = row[:name]
    @description = row[:description]
    @unit_price  = BigDecimal.new(row[:unit_price])/100
    @merchant_id = row[:merchant_id]
    @created_at  = Date.parse(row[:created_at])
    @updated_at  = row[:updated_at]
    @repository  = repository
  end

  def merchant
    repository.find_merchant_by_id(merchant_id)
  end

  def invoice_items
    repository.find_invoice_items_by_id(id)
  end

  def successful_transactions
    merchant.successful_invoices
  end

  def revenue
    successful_transactions.map(&:revenue).reduce(0, :+)
  end

  def items_sold
    successful_transactions.map(&:items_sold)
  end

  def best_day
    day_count = Hash.new(0)
    successful_transactions.map do |transaction|
     day_count[transaction.created_at] += 1
    end
    day_count.key(day_count.values.max)
  end
end
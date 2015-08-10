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
    @unit_price  = row[:unit_price]
    @merchant_id = row[:merchant_id]
    @created_at  = row[:created_at]
    @updated_at  = row[:updated_at]
    @repository  = repository
  end

  def merchant
    repository.find_merchant_by_id(id)
  end

  def invoice_items
    repository.find_invoice_items_by_id(id)
  end

  def most_items(x)

  end
end
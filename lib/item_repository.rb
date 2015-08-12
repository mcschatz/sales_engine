require_relative 'item_loader'
require_relative 'item'
require 'bigdecimal'

class ItemRepository
 attr_accessor :items
 attr_reader   :filename, :engine

  def initialize(items, engine)
    @items  ||= items
    @engine ||= engine
  end

  def add_item(row, repository)
    items << Item.new(row, self)
  end

  def all
    items
  end

  def random
    items.sample
  end

  def find_by_id(id)
    items.find {|item| item.id == id}
  end

  def find_by_name(name)
    items.find {|item| item.name.downcase == name.downcase}
  end

  def find_by_description(description)
    items.find {|item| item.description.downcase == description.downcase}
  end

  def find_by_unit_price(price)
    items.find {|item| item.unit_price == price}
  end

  def find_by_merchant_id(id)
    items.find {|item| item.merchant_id == id}
  end

  def find_all_by_id(id)
    if id != ''
      items.find_all {|item| item.id == id}
    else
      []
    end
  end

  def find_all_by_name(name)
    if name != ''
      items.find_all {|item| item.name == name}
    else
      []
    end
  end

  def find_all_by_description(description)
    if description != ''
      items.find_all {|item| item.description == description}
    else
      []
    end
  end

  def find_all_by_unit_price(price)
    if price != ''
      items.find_all {|item| item.unit_price == price }
    else
      []
    end
  end

  def find_all_by_merchant_id(id)
    if id != ''
      items.find_all {|item| item.merchant_id == id}
    else
      []
    end
  end

  def find_merchant_by_id(id)
    engine.find_merchant_by_id(id)
  end

  def find_invoice_items_by_id(id)
    engine.find_all_invoice_items_by_item_id(id)
  end

  def most_revenue(x = 0)
    results = items.sort_by do |item|
      item.revenue
    end
    results.reverse[0..(x-1)]
  end

  def most_items(x = 0)
    results = items.sort_by do |items|
      items.items_sold
    end
    results.reverse[0..(x-1)]
  end

  def inspect
    "#<#{self.class} #{@items.size} rows>"
  end
end
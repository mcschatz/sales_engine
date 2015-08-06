require_relative 'item_loader'
require_relative 'item'

class ItemRepository
 attr_accessor :items
 attr_reader   :filename

  def initialize(items)
    @items = items
  end

  def add_item(row, repository)
    items << item.new(row, self)
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

  def find_by_created_at(date)
    items.find {|item| item.created_at == date}
  end

  def find_by_updated_at(date)
    items.find {|item| item.updated_at == date}
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
      items.find_all {|item| item.unit_price == price}
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

  def find_all_by_created_at(date)
    if date != ''
      items.find_all {|item| item.created_at == date}
    else
      []
    end
  end

  def find_all_by_updated_at(date)
    if date != ''
      items.find_all {|item| item.updated_at == date}
    else
      []
    end
  end
end
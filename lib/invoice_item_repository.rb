require_relative 'invoice_item_loader'
require_relative 'invoice_item'

class InvoiceItemRepository
 attr_accessor :invoice_items
 attr_reader :filename, :engine

  def initialize(invoice_items, engine)
    @invoice_items = invoice_items
    @engine        = engine
  end

  def add_invoice_item(row, repository)
    invoice_items << InvoiceItem.new(row, self)
  end

  def all
    invoice_items
  end

  def random
    invoice_items.sample
  end

  def find_by_id(id)
    invoice_items.find {|invoice_item| invoice_item.id == id}
  end

  def find_by_item_id(id)
    invoice_items.find {|invoice_item| invoice_item.item_id == id}
  end

  def find_by_invoice_id(id)
    invoice_items.find {|invoice_item| invoice_item.invoice_id == id}
  end

  def find_by_quantity(quantity)
    invoice_items.find {|invoice_item| invoice_item.quantity == quantity}
  end

  def find_by_unit_price(unit_price)
    invoice_items.find {|invoice_item| invoice_item.unit_price == unit_price}
  end

  def find_all_by_id(id)
    if id != ''
      invoice_items.find_all {|invoice_item| invoice_item.id == id}
    else
      []
    end
  end

  def find_all_by_item_id(item_id)
    if item_id != ''
      invoice_items.find_all {|invoice_item| invoice_item.item_id == item_id}
    else
      []
    end
  end

  def find_all_by_invoice_id(invoice_id)
    if invoice_id != ''
      invoice_items.find_all {|invoice_item| invoice_item.invoice_id == invoice_id}
    else
      []
    end
  end

  def find_all_by_quantity(quantity)
    if quantity != ''
      invoice_items.find_all {|invoice_item| invoice_item.quantity == quantity}
    else
      []
    end
  end

  def find_all_by_unit_price(unit_price)
    if unit_price != ''
      invoice_items.find_all {|invoice_item| invoice_item.unit_price == unit_price}
    else
      []
    end
  end

  def find_invoice_by_id(id)
    engine.find_invoice_by_id(id)
  end

  def find_item_by_id(id)
    engine.find_item_by_id(id)
  end
end

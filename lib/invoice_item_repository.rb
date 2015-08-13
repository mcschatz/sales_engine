require_relative 'invoice_item_loader'
require_relative 'invoice_item'

class InvoiceItemRepository
 attr_accessor :invoice_items
 attr_reader :filename, :engine

  def initialize(invoice_items, engine)
    @invoice_items ||= invoice_items
    @engine        ||= engine
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

  def find_all_by_item_id(id)
    if id != ''
      invoice_items.find_all {|invoice_item| invoice_item.item_id == id}
    else
      []
    end
  end

  def find_all_by_invoice_id(id)
    if id != ''
      invoice_items.find_all {|invoice_item| invoice_item.invoice_id == id}
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

  def find_all_by_unit_price(price)
    if price != ''
      invoice_items.find_all {|invoice_item| invoice_item.unit_price == price}
    else
      []
    end
  end

  def find_invoice_by_invoice_id(id)
    engine.find_invoice_by_id(id)
  end

  def find_item_by_id(id)
    engine.find_item_by_id(id)
  end

  def create_invoice_items(items, new_invoice_id)
    items.map do |item|
      new_invoice_item = InvoiceItem.new({id: next_id,
        item_id: item.id,
        invoice_id: new_invoice_id,
        quantity: 1,
        unit_price: item.unit_price,
        created_at: Time.new.strftime("%c %d, %Y"),
        updated_at: Time.new.strftime("%c %d, %Y")},
        self)
      invoice_items << new_invoice_item
    end
  end

  def next_id
    if invoice_items.last.nil?
      1
    else
      invoice_items.last.id.next
    end
  end

  def inspect
    "#<#{self.class} #{@invoice_items.size} rows>"
  end
end

require_relative 'merchant_repository'
require_relative 'customer_repository'
require_relative 'invoice_item_repository'
# require_relative 'invoice_repository'
# require_relative 'item_repository'
# require_relative 'transaction_repository'

class SalesEngine
  attr_reader :merchant_repository, :customer_repository, :invoice_item_repository

  def initialize(data_dir="data")
    @data_dir = data_dir
    @merchant_repository      = MerchantRepository.new([], self)
    @customer_repository      = CustomerRepository.new([], self)
    @invoice_item_repository  = InvoiceItemRepository.new([], self)
  end

  def startup
    MerchantLoader.new(@merchant_repository, "./#{@data_dir}/merchants.csv")
                  .parse_merchants
    CustomerLoader.new(@customer_repository, "./#{@data_dir}/customers.csv")
                  .parse_customers
    InvoiceItemLoader.new(@invoice_item_repository, "./#{@data_dir}/invoice_items.csv")
                  .parse_invoice_items
  end

  def find_items_by_merchant_id(id)
    item_repository.find_all_by_merchant_id(id)
  end
end


engine = SalesEngine.new
engine.startup
engine.merchant_repository.inspect
engine.customer_repository.inspect
# engine.invoice_repository
# engine.item_repository
puts engine.invoice_item_repository.inspect
# engine.customer_repository
# engine.transaction_repository
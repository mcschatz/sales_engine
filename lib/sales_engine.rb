require_relative 'merchant_repository'
require_relative 'customer_repository'
# require_relative 'invoice_item_repository'
# require_relative 'invoice_repository'
# require_relative 'item_repository'
# require_relative 'transaction_repository'

class SalesEngine
  attr_reader :merchant_repository, :customer_repository

  def initialize(data_dir="data")
    @data_dir = data_dir
    @merchant_repository = MerchantRepository.new([])
    @customer_repository = CustomerRepository.new([])
  end

  def startup
    MerchantLoader.new(@merchant_repository, "./#{@data_dir}/merchants.csv")
                  .parse_merchants
    CustomerLoader.new(@customer_repository, "./#{@data_dir}/customers.csv")
                  .parse_customers
  end
end


engine = SalesEngine.new
engine.startup
engine.merchant_repository.inspect
puts engine.customer_repository.inspect
# engine.invoice_repository
# engine.item_repository
# engine.invoice_item_repository
# engine.customer_repository
# engine.transaction_repository
require_relative 'merchant_repository'
# require_relative 'customer_repository'
# require_relative 'invoice_item_repository'
# require_relative 'invoice_repository'
# require_relative 'item_repository'
# require_relative 'transaction_repository'

class SalesEngine
  attr_reader :merchant_repository

  def initialize(data_dir="data")
    @data_dir = data_dir
    @merchant_repository = MerchantRepository.new([])
  end

  def startup
    MerchantLoader.new(@merchant_repository, "./#{@data_dir}/merchants.csv")
                  .parse_merchants
  end
end


engine = SalesEngine.new
engine.startup
puts engine.merchant_repository.inspect
# engine.invoice_repository
# engine.item_repository
# engine.invoice_item_repository
# engine.customer_repository
# engine.transaction_repository
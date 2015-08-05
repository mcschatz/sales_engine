require_relative 'merchant_loader'
require_relative 'merchant'

class MerchantRepository
 attr_accessor :merchants

  def initialize
    @merchants = load_merchants
  end

  def load_merchants
   MerchantLoader.new(self, '../data/merchants.csv').parse_merchants(self, '../data/merchants.csv')
  end

  def all
    merchants
  end

end

puts MerchantRepository.new.load_merchants

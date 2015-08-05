require_relative 'merchant_loader'
require_relative 'merchant'

class MerchantRepository
 attr_accessor :merchants

  def initialize
    @merchants = []
  end

  def load_merchants
   MerchantLoader.new(self, './data/merchants.csv')
  end

  def add_merchant(row, repository)
  	merchants << Merchant.new(row, self)
	end

  def all
    merchants
  end

  def random
    merchants.sample
  end

  def find_by_name(name)
    merchants.find {|merchant| merchant.name == name}
  end 

  def find_by_id(id)
    merchants.find {|merchant| merchant.id == id}
  end

  def find_by_created_at(date)
    merchants.find {|merchant| merchant.created_at == date}
  end

  def find_by_updated_at(date)
    merchants.find {|merchant| merchant.updated_at == date}
  end

  def find_all_by_name(name)
    merchants.find_all {|merchant| merchant.name == name}
  end 

  def find_all_by_id(id)
    merchants.find_all {|merchant| merchant.id == id}
  end

  def find_all_by_created_at(date)
    merchants.find_all {|merchant| merchant.created_at == date}
  end

  def find_all_by_updated_at(date)
    merchants.find_all {|merchant| merchant.updated_at == date}
  end

end

mr = MerchantRepository.new
mr.load_merchants
mr.merchants.first.name
puts mr.find_all_by_name('Williamson Group')

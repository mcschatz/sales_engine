require_relative 'merchant_loader'
require_relative 'merchant'

class MerchantRepository
 attr_accessor :merchants
 attr_reader :filename

  def initialize(merchants)
    @merchants = merchants
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
    merchants.find {|merchant| merchant.name.downcase == name.downcase}
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
    if name != ''
      merchants.find_all {|merchant| merchant.name == name}
    else
      []
    end
  end

  def find_all_by_id(id)
    if id != ''
      merchants.find_all {|merchant| merchant.id == id}
    else
      []
    end
  end

  def find_all_by_created_at(date)
    if date != ''
      merchants.find_all {|merchant| merchant.created_at == date}
    else
      []
    end
  end

  def find_all_by_updated_at(date)
    if date != ''
      merchants.find_all {|merchant| merchant.updated_at == date}
    else
      []
    end
  end

end

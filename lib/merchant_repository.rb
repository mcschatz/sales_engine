require_relative 'merchant_loader'
require_relative 'merchant'
require 'pry'

class MerchantRepository
 attr_accessor :merchants
 attr_reader :filename, :engine

  def initialize(merchants, engine)
    @merchants  = merchants
    @engine     = engine
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

  def find_by_id(id)
    merchants.find {|merchant| merchant.id == id}
  end

  def find_by_name(name)
    merchants.find {|merchant| merchant.name.downcase == name.downcase}
  end

  def find_all_by_id(id)
    if id != ''
      merchants.find_all {|merchant| merchant.id == id}
    else
      []
    end
  end

  def find_all_by_name(name)
    if name != ''
      merchants.find_all {|merchant| merchant.name == name}
    else
      []
    end
  end

  def find_items_by_merchant_id(id)
    engine.find_all_items_by_merchant_id(id)
  end

  def find_invoices_by_merchant_id(id)
    engine.find_all_invoices_by_merchant_id(id)
  end

  def find_invoice_items_by_id(id)
    engine.find_all_invoice_items_by_invoice_id(id)
  end

  def find_transactions_by_invoice_id(id)
    engine.find_transactions_by_invoice_id(id)
  end

  def successful_transactions(id)
    engine.successful_transactions(id)
  end

  def most_revenue(x = 0)
    results = merchants.sort_by do |merchant|
      merchant.revenue
    end
    results.reverse[0..(x-1)].map(&:id)
  end

  def most_items(x = 0)
    results = merchants.sort_by do |merchant|
      merchant.items_sold
    end
    results.reverse[0..(x-1)].map(&:id)
  end

  def revenue(date)
   merchants.map do |merchant|
      merchant.total_revenue(date)
    end.reduce(:+)
  end
end










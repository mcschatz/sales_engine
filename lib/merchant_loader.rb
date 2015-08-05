require 'CSV'
require_relative 'merchant'

class MerchantLoader

  def initialize(repository, filename)
    parse_merchants(repository, filename)
  end

  def parse_merchants(repository, filename)
    merchants = []
    data = CSV.open(filename, headers: true, header_converters: :symbol)
    data.each do |row|
      merchants << Merchant.new(repository, row[:id], row[:name], row[:created_at], row[:updated_at])
    end
    merchants
  end
end
require 'CSV'
require_relative 'merchant'

class MerchantLoader

  def initialize(repository, filename)
    parse_merchants(repository, filename)
  end

  # def parse_merchants(repository, filename)
  #   data = CSV.open(filename, headers: true, header_converters: :symbol)
  #   merchants = data.foreach do |row|
  #     Merchant.new(repository, row[:id], row[:name], row[:created_at], row[:updated_at])
  #   end
  # end

  def parse_merchants(repository, filename)
    stuff = {}
    CSV.foreach(filename, :headers => true, :header_converters => :symbol) do |row|
      stuff[row.fields[0]] = Hash[row.headers[1..-1].zip(row.fields[1..-1])]
    end
    stuff
  end
end

#Make each row a hash before you assign the attributes



# tickers = {}

# CSV.foreach("stocks.csv", :headers => true, :header_converters => :symbol, :converters => :all) do |row|
#   tickers[row.fields[0]] = Hash[row.headers[1..-1].zip(row.fields[1..-1])]
# end
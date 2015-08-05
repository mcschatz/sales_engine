require 'CSV'
require_relative 'merchant'

class MerchantLoader

  def initialize(repository, filename)
    parse_merchants(repository, filename)
  end

  def parse_merchants(repository, filename)
    CSV.foreach(filename, :headers => true, :header_converters => :symbol) do |row|
      repository.add_merchant(row, repository)
    end
  end
end
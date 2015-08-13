require 'CSV'
require_relative 'merchant'

class MerchantLoader

  def initialize(repository, filename)
    @repository = repository
    @filename   = filename
  end

  def parse_merchants
    CSV.foreach(@filename, :headers => true, :header_converters => :symbol,
    :converters => :numeric) do |row|
      @repository.add_merchant(row, @repository)
    end
  end
end
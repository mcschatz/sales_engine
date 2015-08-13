require 'CSV'
require_relative 'customer'

class CustomerLoader

  def initialize(repository, filename)
    @repository = repository
    @filename   = filename
  end

  def parse_customers
    CSV.foreach(@filename, :headers => true, :header_converters => :symbol,
    :converters => :numeric) do |row|
      @repository.add_customer(row, @repository)
    end
  end
end
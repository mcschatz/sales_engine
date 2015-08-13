require 'CSV'
require_relative 'item'

class ItemLoader

  def initialize(repository, filename)
    @repository = repository
    @filename   = filename
  end

  def parse_items
    CSV.foreach(@filename, :headers => true, :header_converters => :symbol,
    :converters => :numeric) do |row|
      @repository.add_item(row, @repository)
    end
  end
end
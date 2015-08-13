require 'CSV'
require_relative 'transaction'

class TransactionLoader

  def initialize(repository, filename)
    @repository = repository
    @filename   = filename
  end

  def parse_transactions
    CSV.foreach(@filename, :headers => true, :header_converters => :symbol,
    :converters => :numeric) do |row|
      @repository.add_transaction(row, @repository)
    end
  end
end
require 'CSV'

class FileIO

  def load_file(filename = 'transactions.csv')
    CSV.open(filename, headers: true, header_converters: :symbol)
  end
end
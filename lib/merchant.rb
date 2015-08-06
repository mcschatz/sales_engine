class Merchant
  attr_reader :id,
              :name,
              :created_at,
              :updated_at

  def initialize(row, repository)
    @id         = row[:id]
    @name       = row[:name]
    @created_at = row[:created_at]
    @updated_at = row[:updated_at]
    @repository = repository
  end
end
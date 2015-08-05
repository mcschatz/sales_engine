class Merchant
  attr_reader :id, :name, :created_at, :updated_at

  def initialize(repository, id, name, created_at, updated_at)
    @id = id
    @name = name
    @created_at = created_at
    @updated_at = updated_at
    @repository = repository
  end
end
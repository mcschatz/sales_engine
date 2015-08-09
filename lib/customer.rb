class Customer
  attr_reader :id,
              :first_name,
              :last_name,
              :created_at,
              :updated_at,
              :repository

  def initialize(row, repository)
    @id         = row[:id]
    @first_name = row[:first_name]
    @last_name  = row[:last_name]
    @created_at = row[:created_at]
    @updated_at = row[:updated_at]
    @repository = repository
  end

  def invoices
    repository.find_invoices_by_customer_id(id)
  end

  def transactions
    invoices.map do |invoice|
      invoice.transactions
    end.flatten
  end

  def favorite_merchant
  end
end


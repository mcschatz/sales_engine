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

  def successful_invoices
    invoices.select do |invoice|
      invoice.successful_transactions
    end
  end

  def transactions
    invoices.map do |invoice|
      invoice.transactions
    end.flatten
  end

  def favorite_merchant
    id_count = Hash.new(0)
    successful_invoices.map do |invoice|
     id_count[invoice.merchant_id] += 1
    end
    id_count.key(id_count.values.max)
  end
end


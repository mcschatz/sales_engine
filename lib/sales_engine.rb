require_relative 'merchant_repository'
require_relative 'customer_repository'
require_relative 'invoice_item_repository'
require_relative 'invoice_repository'
require_relative 'item_repository'
require_relative 'transaction_repository'

class SalesEngine
  attr_reader :merchant_repository,
              :customer_repository,
              :invoice_item_repository,
              :invoice_repository,
              :item_repository,
              :transaction_repository

  def initialize(data_dir="data")
    @data_dir                 ||= data_dir
    @merchant_repository      ||= MerchantRepository.new([], self)
    @customer_repository      ||= CustomerRepository.new([], self)
    @invoice_item_repository  ||= InvoiceItemRepository.new([], self)
    @invoice_repository       ||= InvoiceRepository.new([], self)
    @item_repository          ||= ItemRepository.new([], self)
    @transaction_repository   ||= TransactionRepository.new([], self)
  end

  def startup
    TransactionLoader.new(@transaction_repository,
                    "#{@data_dir}/transactions.csv").parse_transactions
    MerchantLoader.new(@merchant_repository,
                    "#{@data_dir}/merchants.csv").parse_merchants
    CustomerLoader.new(@customer_repository,
                    "#{@data_dir}/customers.csv").parse_customers
    InvoiceItemLoader.new(@invoice_item_repository,
                    "#{@data_dir}/invoice_items.csv").parse_invoice_items
    InvoiceLoader.new(@invoice_repository,
                    "#{@data_dir}/invoices.csv").parse_invoices
    ItemLoader.new(@item_repository,
                    "#{@data_dir}/items.csv").parse_items
  end

  def find_item_by_id(id)
    item_repository.find_by_id(id)
  end

  def find_invoice_by_id(id)
    invoice_repository.find_by_id(id)
  end

  def find_merchant_by_id(id)
    merchant_repository.find_by_id(id)
  end

  def find_all_items_by_merchant_id(id)
    item_repository.find_all_by_merchant_id(id)
  end

  def find_all_invoices_by_merchant_id(id)
    invoice_repository.find_all_by_merchant_id(id)
  end

  def find_all_invoices_by_customer_id(id)
    invoice_repository.find_all_by_customer_id(id)
  end

  def find_all_invoice_items_by_item_id(id)
    invoice_item_repository.find_all_by_item_id(id)
  end

  def find_all_transactions_by_invoice_id(id)
    transaction_repository.find_all_by_invoice_id(id)
  end

  def find_all_invoice_items_by_invoice_id(id)
    invoice_item_repository.find_all_by_invoice_id(id)
  end

  def find_customer_by_id(id)
    customer_repository.find_by_id(id)
  end

  def successful_transactions
    invoice_repository.successful_transactions
  end

  def create_invoice_items(items, new_invoice_id)
    invoice_item_repository.create_invoice_items(items, new_invoice_id)
  end

  def charge(payment_data, invoice_id)
    transaction_repository.charge(payment_data, invoice_id)
  end
end
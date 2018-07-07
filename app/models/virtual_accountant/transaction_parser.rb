require 'csv'

class VirtualAccountant::TransactionParser
  DATA_STARTS_AT_ROW = 1

  def self.parse_general_ledger(input_path)
    current_category = nil
    prior_row = nil # Want ability to read up one row

    # CSV.read(input_path, encoding: "UTF-16", col_sep: "\t").each.with_index do |row, index|
    CSV.read(input_path, encoding: "UTF-8", col_sep: ",").each.with_index do |row, index|
      next if index < DATA_STARTS_AT_ROW
      record_description, * = row

      transaction_hash = VirtualAccountant::Transaction.row_to_transaction_hash(row)
      transaction = VirtualAccountant::Transaction.new(transaction_hash)
      if transaction.valid?
        current_category.transactions.push(transaction)
      else
        if VirtualAccountant::Category.start_new_category?(record_description) then
          current_category = VirtualAccountant::Category.new(name: record_description)
        elsif VirtualAccountant::Category.end_current_category?(record_description)
          current_category.set_total(prior_row) # Prior row contains total for transactions
          current_category.set_net(row)
          current_category.save
        end
      end
      prior_row = row
    end
  end
end

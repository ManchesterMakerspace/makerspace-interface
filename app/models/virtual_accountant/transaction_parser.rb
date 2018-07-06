require 'csv'

class VirtualAccountant::TransactionParser
  attr_accessor :current_category, :transaction_json

  DATA_STARTS_AT_ROW=6

  def initialize
    super
    self.transaction_json = {}
  end

  def parse_general_ledger(
      input_path,
      output_file="#{Rails.root}/dump/report_#{Time.now.strftime('%m-%d-%Y')}.csv"
    )
    CSV.read(input_path, encoding: "UTF-16", col_sep: "\t").each.with_index do |row, index|
      next if index < DATA_STARTS_AT_ROW
      parse_row(row)
    end
    write_chart_csv(output_file)
  end

  def parse_row(row)
    transaction_hash = VirtualAccountant::Transaction.row_to_transaction_hash(row)
    transaction = VirtualAccountant::Transaction.new(transaction_hash)
    if transaction.valid?
      transactions = self.transaction_json[self.current_category.name][:transactions]
      transactions.push(transaction)
    else
      record_description, *, credit_amt, debit_amt = row
      if record_description !~ /^(Net|Total)/
        self.current_category = VirtualAccountant::Category.new(name: record_description)
        add_new_category
      elsif record_description =~ Regexp.new("^(Total #{self.current_category.name})")
        self.current_category.total = calc_transaction_total(credit_amt, debit_amt)
      elsif record_description == "Net Movement"
        self.current_category.net = debit_amt
      end
    end
  end

  def from_currency(string_num)
    return string_num.gsub(",", "").to_f.round(2)
  end

  def calc_transaction_total(credit, debit)
    (from_currency(debit) - from_currency(credit)).round(2)
  end

  def parse_description(description)
    return if description.nil?
    transaction_string, description = description.split(" - ", 2)
    if !transaction_string.nil?
      transaction_string.strip!
      self.determine_transaction_type(transaction_string)
    end
  end

  def transfer_to(description)
  end

  def transfer_from(description)
  end

  def add_new_category
    self.transaction_json[self.current_category.name] = {
      transactions: [],
    }
  end

  def write_chart_csv(output_file)
    config = {
      encoding: 'UTF-8',
      col_sep: ","
    }
    CSV.open(output_file, "wb", config) do |csv|
      self.transaction_json.each do |key, trans_obj|
        csv << [key] if !!key
        if trans_obj[:transactions] then
          trans_obj[:transactions].each do |transaction|
            key, value = transaction
            if key.class == Date then
              csv << [key.strftime("%m/%d/%Y"), value]
            else
              csv << [key, value]
            end
          end
        end
      end
    end
  end
end

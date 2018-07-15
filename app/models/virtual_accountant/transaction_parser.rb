require 'csv'

class VirtualAccountant::TransactionParser
  attr_accessor :current_category

  @@DATA_STARTS_AT_ROW = 1

  def self.start
    self.new.parse_general_ledger('/home/will/Downloads/Manchester Makerspace Detailed General Ledger from 2015-08-01 to 2018-07-07.csv' )
  end

  def parse_general_ledger(input_path)
    @current_category = nil # May also be an account
    prior_row = nil # Want ability to read up one row

    # CSV.read(input_path, encoding: "UTF-16", col_sep: "\t").each.with_index do |row, index|
    CSV.read(input_path, encoding: "UTF-8", col_sep: ",").each.with_index do |row, index|
      next if index < @@DATA_STARTS_AT_ROW
      record_description, * = row
      next if record_description.nil?


      begin
        Date.parse(record_description)
        transaction_hash = row_to_transaction_hash(row)
        transaction = VirtualAccountant::Transaction.new(transaction_hash)
        determine_transaction_type(transaction)
        if transaction.valid?
          @current_category.transactions.push(transaction)
        else
          byebug
        end
      rescue ArgumentError
        if start_new_category?(record_description) then
          if VirtualAccountant::Account.is_bank_account?(record_description) then
            @current_category = VirtualAccountant::Account.new(name: record_description)
          else
            @current_category = VirtualAccountant::Category.new(name: record_description)
          end
        elsif end_current_category?(record_description)
          parse_total(prior_row)
          parse_net(row.last)
          accounts = @current_category.transactions.reduce(0) { |sum, t| sum += t.account.nil? ? 0 : 1 }
          if @current_category.class == VirtualAccountant::Category && accounts != @current_category.transactions.size
            @current_category.transactions = VirtualAccountant::Transaction.find_duplicates(@current_category.transactions)
          end
          # This is where EVERYTHING saves
          # Transactions are autosaved w/ their assoc account || category
          unless @current_category.save
            byebug
          end
        end
      end
      prior_row = row
    end
  end

  private
  def parse_net(amount)
    return if amount.nil?
    if amount.gsub!(/^\(|\)$/, '')
      amount = -amount
    end
    @current_category.reported_net = from_currency(amount)
  end

  def parse_total(csv_row)
    return unless csv_row.first =~ Regexp.new("^(Total #{@current_category.name})")
    *, debit, credit = csv_row
    @current_category.reported_debit = from_currency(debit)
    @current_category.reported_credit = from_currency(credit)
  end

  def start_new_category?(record_description)
    record_description !~ /^(Net|Total)/
  end

  def end_current_category?(record_description)
    record_description == "Net Movement"
  end

  def from_currency(string_num)
    return string_num.gsub(",", "").to_f.round(2)
  end

  def row_to_transaction_hash(csv_row)
    date, description, debit, credit = csv_row
    credit_amt = credit.gsub(",", "") unless credit.nil?
    debit_amt = debit.gsub(",", "") unless debit.nil?
    { date: date, description: description, credit_amt: credit_amt, debit_amt: debit_amt}
  end

  def calculate_net_transaction_amt(transaction)
    credit_first = (transaction.credit_amt || 0) - (transaction.debit_amt || 0)
    debit_first = (transaction.debit_amt || 0) - (transaction.credit_amt || 0)

    if @current_category.class == VirtualAccountant::Account
      case transaction.type.to_sym
      when :expense, :transfer_from
        transaction.net_amt = credit_first
      when :income, :transfer_to, :journal
        transaction.net_amt = debit_first
      end
    else
      case transaction.type.to_sym
      when :expense, :transfer_from
        transaction.net_amt = debit_first
      when :income, :transfer_to, :journal
        transaction.net_amt = credit_first
      end
    end
  end

  def determine_transaction_type(transaction)
    transaction_string, * = transaction.description.split(" - ", 2) unless transaction.description.nil?
    transaction_string.strip!
    if /^.+( to)/ === transaction_string
      transaction.type = :transfer_to
    elsif /^.+( from)/ === transaction_string
      transaction.type = :transfer_from
    else
      trans_type = transaction_string.split(" ").map { |p| p.strip }.compact.first
      if /(Expense|Income)/ === trans_type
        transaction.type = trans_type === "Expense" ? :expense : :income
      elsif trans_type
        transaction.type = :journal
      end
    end
    calculate_net_transaction_amt(transaction)
  end
end

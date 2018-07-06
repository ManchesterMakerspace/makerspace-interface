require 'csv'

class VirtualAccountant::TransactionParser
  attr_accessor :current_category, :transaction_json, :group_by

  GROUP_BY_OPTIONS = {
    Month: :month,
    Week: :week
  }

  def self.group_by_options
    return GROUP_BY_OPTIONS
  end

  def initialize
    super
    self.transaction_json = {}
  end

  def parse_general_ledger(
      input_path,
      output_file="#{Rails.root}/dump/report_#{Time.now.strftime('%m-%d-%Y')}.csv",
      group_by=:month
    )
    self.group_by = group_by
    skip_to = 6
    CSV.read(input_path, encoding: "UTF-16", col_sep: "\t").each.with_index do |row, index|
      next if index < skip_to
      parse_row(row)
    end
    write_chart_csv(output_file)
  end

  def parse_row(row)
    col_one, col_two, col_three, col_four = row #date, description, credit, debit
    begin
       date = Date.parse(col_one) unless col_one.nil?
       return if date.nil?
       transactions = self.transaction_json[self.current_category][:transactions]
       if self.group_by == GROUP_BY_OPTIONS[:Month]
         transaction_key = Date.new(date.year, date.month)
       elsif self.group_by == GROUP_BY_OPTIONS[:Week]
         transaction_key = date.sunday
       end
       current_total = transactions[transaction_key] || 0
       current_total += calc_transaction_total(col_three, col_four)
       transactions[transaction_key] = current_total

    rescue ArgumentError
      if col_one !~ /^(Net|Total)/
        self.current_category = col_one
        add_new_category(row)
      elsif col_one =~ Regexp.new("^(Total #{current_category})")
        self.transaction_json[self.current_category]["Total"] = calc_transaction_total(col_three, col_four)
      elsif col_one == "Net Movement"
        self.transaction_json[self.current_category]["Net"] = col_four
      end
    end
    self.parse_description(col_two)
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

  def determine_transaction_type(description)
    if /^.+( to)/ === description
      transfer_to(description)
    elsif /^.+( from)/ === description
      transfer_from(description)
    else
      trans_type = description.split(" ").map { |p| p.strip }.compact.first
      throw "Invalid type #{description}" unless /(Expense|Income)/ === trans_type
      # Set object to expense or income
    end
  end

  def transfer_to(description)
  end

  def transfer_from(description)
  end

  def add_new_category(row)
    current_category, description, credit, debit = row
    self.transaction_json[current_category] = {
      transactions: {},
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

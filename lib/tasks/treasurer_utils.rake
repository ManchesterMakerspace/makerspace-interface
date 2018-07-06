require_relative '../treasurer_utils/transaction_parser'

task :configure_transactions, [:input_file, :output_file, :group_by] do |t, args|
  if !args[:input_file] then
    throw "Nothing to parse"
  end

  if args[:output_file] && !args[:output_file].match?(/(.csv)$/) then
    throw "Task can only be used with CSV files"
  end

  if TranscationParser.group_by_options.include?(args[:group_by]) then
    throw "Group option not found"
  end
  output = args[:output_file] || "#{Rails.root}/dump/report_#{Time.now.strftime('%m-%d-%Y')}.csv"

  parser = TranscationParser.new
  parser.parse_general_ledger(args[:input_file], output, args[:group_by])
end

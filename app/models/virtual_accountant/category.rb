class VirtualAccountant::Category
  include Mongoid::Document
  include VirtualAccountant

  store_in collection: "categories", database: "makerspace_accounting", client: "accounting"

  field :name, type: String
  field :total, type: Float
  field :net, type: Float

  has_many :transactions, class_name: "VirtualAccountant::Transaction", autosave: true
  # has_many :vendors, class_name: "VirtualAccountant::Vendor"

  def self.start_new_category?(record_description)
    record_description !~ /^(Net|Total)/
  end

  def self.end_current_category?(record_description)
    record_description == "Net Movement"
  end

  def set_total(csv_row)
    throw "Invalid Total" unless csv_row.first =~ Regexp.new("^(Total #{self.name})")

    *, debit, credit = csv_row
    self.write_attribute(:total, (from_currency(debit) - from_currency(credit)).round(2))
  end

  def set_net(csv_row)
    net_amt = csv_row.last
    if net_amt.gsub!(/^\(|\)$/, '')
      net_amt = -net_amt
    end
    self.write_attribute(:net, from_currency(net_amt))
  end
end

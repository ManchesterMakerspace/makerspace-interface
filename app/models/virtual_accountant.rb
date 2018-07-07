module VirtualAccountant
  def from_currency(string_num)
    return string_num.gsub(",", "").to_f.round(2)
  end
end

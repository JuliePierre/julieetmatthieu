require "csv"

lunch_list = []
diner_list = []
filepath = File.join(__dir__, 'liste.csv')
csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
CSV.foreach(filepath, csv_options) do |row|
  lunch_list << row[0] unless row[0].blank?
  diner_list << row[1] unless row[1].blank?
end

puts lunch_list.to_yaml
puts diner_list.to_yaml

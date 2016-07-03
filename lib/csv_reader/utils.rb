# == Parameters:
# content::
#   A content from CSV will be parsed
#
# Use CSV.parse() to parse the CSV content using tabs as field delimiters
#
def parse_csv_file_content(content)
  deep_compact(CSV.parse(content, col_sep: "\t"))
end

def deep_compact(csv_array)
  csv_array.map do |i|
    i.compact if i.compact.any?
  end.compact
end

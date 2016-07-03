# == Parameters:
# content::
#   A content from CSV will be parsed
#
# Use CSV.parse() to parse the CSV content using tabs as field delimiters
#
def parse_csv_file_content(content)
  deep_compact(CSV.parse(content, col_sep: "\t"))
end

# == Parameters:
# csv_matrix::
#   Matrix representating a CSV content
#
# Remove all `nil` content from Matrix
#
def deep_compact(csv_matrix)
  csv_matrix.map do |i|
    i.compact if i.compact.any?
  end.compact
end

# == Parameters:
# csv_matrix::
#   Matrix representing a CSV content
# header::
#   Hash keys. Each header represents each CSV column
#
# Iterate through a Matrix and transform each line in a hash
# where each header is a column of this matrix line.
#
def transform_to_hash(csv_matrix, header)
  csv_matrix.map do |csv_line|
    line = {}
    csv_line.each_with_index do |element, index|
      line[header[index].to_sym] = element
    end
    line
  end
end

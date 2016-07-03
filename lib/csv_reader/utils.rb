# == Parameters:
# content::
#   A content from CSV will be parsed
#
# Use CSV.parse() to parse the CSV content using tabs as field delimiters
#
def parse_csv_file_content(content)
  CSV.parse(content, col_sep: "\t")
end

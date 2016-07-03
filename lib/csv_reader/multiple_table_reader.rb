require 'csv_reader/version'
require 'csv_reader/utils'
require 'csv'

module CsvReader
  class MultipleTableReader
    # == Parameters:
    # csv_content::
    #   A content from CSV will be parsed
    # table_names::
    #   Name of table names inside csv_content
    #
    # MultipleTableReader constructor. Converts a CSV content into a Matrix
    # representating this CSV and split each table found inside
    #
    def initialize(csv_content, table_names)
      @table_names  = table_names
      @csv_matrix   = split_csv_matrix(parse_csv_file_content(csv_content))
    end

    # Iterate through a `@csv_matrix` attribute and convert it to
    # a hash where each key contains a table found inside CSV content
    # passed to constructor's class
    #
    def csv_parsed
      hash = {}
      @csv_matrix.each do |key, value|
        header = @csv_matrix[key].first
        @csv_matrix[key].delete_at(0)
        hash[key] = transform_to_hash(value, header)
      end
      hash
    end

    private

    def split_csv_matrix(list, table_name = nil, list_splitted = {})
      head = list.first
      tail = list - [head]
      head_compacted = head.compact.first
      if is_a_table_name?(head_compacted)
        table_name = head_compacted
        list_splitted[head_compacted.to_sym] = []
      elsif table_name
        list_splitted[table_name.to_sym] << list.first
      end
      return list_splitted if tail.nil? || tail.empty?
      return split_csv_matrix(tail, table_name, list_splitted)
    end

    def is_a_table_name?(line)
      @table_names.include?(line)
    end
  end
end

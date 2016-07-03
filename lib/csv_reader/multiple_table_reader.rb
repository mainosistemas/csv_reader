require 'csv_reader/version'
require 'csv_reader/utils'
require 'csv'
require 'pry'

module CsvReader
  class MultipleTableReader
    def initialize(csv_content, table_names)
      @csv_matrix   = parse_csv_file_content(csv_content)
      @table_names  = table_names
    end

    def csv_parsed
      csv_splitted = split_csv_matrix(@csv_matrix)
      aaaaa = {}
      csv_splitted.each do |key, value|
        @header = csv_splitted[key].first
        csv_splitted[key].delete_at(0)
        aaaaa[key] = value.map do |csv_line|
          line = {}
          csv_line.each_with_index do |element, index|
            line[@header[index].to_sym] = element
          end
          line
        end
      end
      aaaaa
    end

    private

    def split_csv_matrix(list, table = nil, list_splitted = {})
      head = list.first
      tail = list - [head]
      head_compacted = head.compact.first
      if is_a_table_name?(head_compacted)
        table = head_compacted
        list_splitted[head_compacted.to_sym] = []
      elsif table
        list_splitted[table.to_sym] << list.first
      end
      return list_splitted if tail.nil? || tail.empty?
      return split_csv_matrix(tail, table, list_splitted)
    end

    def is_a_table_name?(line)
      @table_names.include?(line)
    end
  end
end

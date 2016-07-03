require 'csv_reader/version'
require 'csv_reader/utils'
require 'csv'

module CsvReader
  class MultipleTableReader
    def initialize(csv_content, table_names)
      @csv_array   = parse_csv_file_content(csv_content)
      @table_names = table_names
      @csv_array = deep_compact(@csv_array)
      @foo = {}
      split_csv_array(@csv_array)
    end

    def csv_parsed
      aaaaa = {}
      @foo.map do |key, value|
        @header = @foo[key].first
        @foo[key].delete_at(0)
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

    def split_csv_array(list, table = nil)
      head = list.first
      tail = list - [head]
      head = head.compact.first
      table_name = nil || table
      if is_a_table_name?(head)
        table_name = head
        @foo[head.to_sym] = []
      elsif table
        @foo[table.to_sym] << list.first
      end
      return if tail.nil? || tail.empty?
      return split_csv_array(tail, table_name)
    end

    def is_a_table_name?(line)
      @table_names.include?(line)
    end

    def deep_compact(csv_array)
      csv_array.map do |i|
        i.compact if i.compact.any?
      end.compact
    end
  end
end

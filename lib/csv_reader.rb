require "csv_reader/version"
require "csv"

module CsvReader
  class Reader
    def initialize(csv_file_content)
      @csv_array = parse_csv_file_content(csv_file_content)
      @header    = get_header
    end

    def self.read(csv_file_content)
      warn '[DEPRECATION] `read` is deprecated.  Please use the class Constructor instead.'
      Reader.new(csv_file_content)
    end

    def array_prepared
      warn '[DEPRECATION] `array_prepared` is deprecated.  Please `csv_parsed` instead.'
      csv_parsed
    end

    def csv_parsed
      @csv_array.map do |csv_line|
        line = {}
        csv_line.each_with_index do |element, index|
          line[@header[index].to_sym] = element
        end
        line
      end
    end

    private

    def parse_csv_file_content(content)
      CSV.parse(content, col_sep: "\t")
    end

    def get_header
      @csv_array.first
      @csv_array.delete_at(0)
    end
  end
end

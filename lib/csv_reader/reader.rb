require 'csv_reader/version'
require 'csv_reader/utils'
require 'csv'

module CsvReader
  class Reader
    # == Parameters:
    # csv_file_content::
    #   A content from CSV will be parsed
    #
    def initialize(csv_file_content)
      @csv_array = parse_csv_file_content(csv_file_content)
      @header    = get_header
    end

    # Old class instantiantion method
    # @deprecated Use class Constructor instead of this
    #
    def self.read(csv_file_content)
      warn '[DEPRECATION] `read` is deprecated.  Please use the class Constructor instead.'
      Reader.new(csv_file_content)
    end

    # Look {#csv_parsed} documentation
    # @deprecated Use {#csv_parsed} instead of this method because this method's name is bad
    #
    def array_prepared
      warn '[DEPRECATION] `array_prepared` is deprecated.  Please use `csv_parsed` instead.'
      csv_parsed
    end

    # Converts a Array of Arrays generated by the method `#parse` from
    # class `CSV` into a array with hashes where each hash is each line from
    # CSV parsed
    #
    # == Returns:
    # The CSV parsed into a array with a lot of hashes, where each hash
    # is each line from CSV
    #
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
    # Get the first line of CSV and remove from {@csv_array}
    # == Returns:
    # A hash with Headers of each column from CSV
    #
    def get_header
      header = @csv_array.first
      @csv_array.delete_at(0)
      header
    end
  end
end

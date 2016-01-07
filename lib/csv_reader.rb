require "csv_reader/version"
require "csv"

module CsvReader
  class Reader
    attr_writer :csv_array, :header
    attr_accessor :array_prepared

    def initialize(params)
      self.csv_array = params[:csv_array]
      self.header = params[:header]
      prepare_csv_array
    end

    def self.read(file)
      csv_array = CSV.parse(file, col_sep: "\t")
      header = csv_array.first
      csv_array.delete_at(0)
      Reader.new(csv_array: csv_array, header: header)
    end

    private

    def prepare_csv_array
      self.array_prepared = []
      @csv_array.each do |csv_line|
        line = {}
        csv_line.each_with_index do |element, index|
          line[@header[index].to_sym] = element
        end
        self.array_prepared << line
      end
    end
  end
end

require 'spec_helper'

describe CsvReader::Reader do
  let(:csv_file) do
    File.new(File.open('spec/fixtures/files/table.csv')).read
  end

  let(:csv_file_read) do
    [
      { name: 'John',  age: '25', email: 'john@test.com'  },
      { name: 'Jimmy', age: '30', email: 'jimmy@test.com' },
      { name: 'Lola',  age: '23', email: 'lola@test.com'  }
    ]
  end

  describe '#array_prepared' do
    it 'Return a array with labels to indicate the rows' do
      expect(CsvReader::Reader.new(csv_file).csv_parsed).to match_array(csv_file_read)
    end
  end
end

require 'spec_helper'

describe CsvReader::Reader do
  let(:csv_file) do
    read_file_from_fixtures('table.csv')
  end

  let(:result) do
    [
      { name: 'John',  age: '25', email: 'john@test.com'  },
      { name: 'Jimmy', age: '30', email: 'jimmy@test.com' },
      { name: 'Lola',  age: '23', email: 'lola@test.com'  }
    ]
  end

  describe '#csv_parsed' do
    it 'Return a array with labels to indicate the rows' do
      expect(CsvReader::Reader.new(csv_file).csv_parsed).to match_array(result)
    end
  end
end

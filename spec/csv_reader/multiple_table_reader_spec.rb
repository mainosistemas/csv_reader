require 'spec_helper'

describe CsvReader::MultipleTableReader do
  let(:csv_file_content) do
    read_file_from_fixtures('multiple_tables.csv')
  end

  let(:result) do
    {
      People: [
        { name: 'John',  age: '25', email: 'john@test.com'  },
        { name: 'Jimmy', age: '30', email: 'jimmy@test.com' },
        { name: 'Lola',  age: '23', email: 'lola@test.com'  }
      ],
      Music: [
        { name: 'Travel Is Dangerous', band: 'Mogwai' },
        { name: 'Frozen Twilight', band: 'God is An Astronaut' }
      ]
    }
  end

  describe '#csv_parsed' do
    it 'Return a hash with various keys, each key is a table and, inside
      this keys has a array with some registers' do
      expect(CsvReader::MultipleTableReader.new(
        csv_file_content,
        ['People', 'Music']
      ).csv_parsed).to match_array(result)
    end
  end
end

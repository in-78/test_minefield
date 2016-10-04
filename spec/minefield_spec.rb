require_relative '../models/minefield'

describe Minefield do
  let(:mine1) { Mine.new(0, 0, 2) }
  let(:mine2) { Mine.new(1, 1, 1) }
  let(:minefield) { described_class.new([mine1, mine2]) }

  describe '#calculate' do

    it 'has result by each mine' do
      minefield.calculate

      expect(minefield.result.keys).to include(mine1.to_s)
      expect(minefield.result[mine1.to_s]).to be_a(Hash)
      expect(minefield.result.keys).to include(mine2.to_s)
      expect(minefield.result[mine2.to_s]).to be_a(Hash)
    end

    it 'contains all information about mine in result' do
      minefield.calculate
      mine_result = minefield.result[mine1.to_s]

      expect(mine_result[:details]).to be_an(Array)
      expect(mine_result[:duration]).to be_an(Integer)
      expect(mine_result[:exploded_mines]).to be_an(Integer)
      expect(mine_result[:rank]).to be_an(Float)
    end

  end

  describe '#sort_by_rank' do

    it 'returns sorted array' do
      minefield.calculate
      result = minefield.sort_by_rank

      expect(result).to be_an(Array)
      expect(result[0][0]).to eq(mine1.to_s)
    end

  end
end

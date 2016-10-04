require_relative '../models/mine'

describe Mine do

  describe '#explodable?' do

    it 'can be exploded by another mine' do
      exploded_mine = described_class.new(1, 1, 1)
      another_mine = described_class.new(0, 0, 2)

      expect(exploded_mine.explodable?([another_mine])).to be_truthy
    end

    it 'can be exploded by one of another mines' do
      exploded_mine = described_class.new(1, 1, 1)
      mine1 = described_class.new(3, 3, 1)
      mine2 = described_class.new(0, 0, 2)

      expect(exploded_mine.explodable?([mine1, mine2])).to be_truthy
    end

    it 'cannot be exploded by another mines' do
      mine = described_class.new(1, 1, 1)
      another_mine = described_class.new(0, 0, 1)

      expect(mine.explodable?([another_mine])).to be_falsey
    end

  end

  describe '#to_s' do

    it 'contains infomation about coordinates and radius' do
      mine = described_class.new(1, 2, 3)
      result = mine.to_s

      expect(result).to include(mine.x.to_s)
      expect(result).to include(mine.y.to_s)
      expect(result).to include(mine.radius.to_s)
    end

  end
end

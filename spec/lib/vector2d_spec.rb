require 'vector2d'

describe 'Vector2d' do
  describe '()' do
    it 'is a shortcut to .new' do
      v = Vector2d(1, 2)
      expect(v).to be_kind_of(Vector2d)
      expect(v.x).to eq 1
      expect(v.y).to eq 2
    end
  end

  describe '+' do
    it 'returns a new Vector2d with components added' do
      a = Vector2d.new(1, 2)
      b = Vector2d.new(3, 4)
      result = a + b
      expect(result).to be_kind_of(Vector2d)
      expect(result.x).to eq 4
      expect(result.y).to eq 6
    end
  end

  describe '*' do
    it 'returns a new Vector2d multiplied by the argument' do
      v = Vector2d(1, 2)
      result = v * 2
      expect(result.x).to eq 2
      expect(result.y).to eq 4
    end
  end

  describe '==' do
    it 'is true on exact x and y equality' do
      expect(Vector2d(1, 2)).to eq Vector2d(1, 2)
    end

    it 'is false on x inequality' do
      expect(Vector2d(1, 2)).to_not eq Vector2d(2, 2)
    end

    it 'is false on y inequality' do
      expect(Vector2d(1, 2)).to_not eq Vector2d(2, 1)
    end
  end
end

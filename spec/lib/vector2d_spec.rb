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
end

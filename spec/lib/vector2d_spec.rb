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
      expect(a + b).to eq Vector2d(4, 6)
    end
  end

  describe '*' do
    it 'returns a new Vector2d multiplied by the argument' do
      v = Vector2d(1, 2)
      expect(v * 2).to eq Vector2d(2, 4)
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

  describe 'wrap' do
    let(:bound) { Vector2d(10, 10) }

    it 'wraps negative x' do
      wrapped = Vector2d(-1, 0).wrap(bound)
      expect(wrapped).to eq Vector2d(9, 0)
    end

    it 'wraps positive x past bound' do
      wrapped = Vector2d(11, 0).wrap(bound)
      expect(wrapped).to eq Vector2d(1, 0)
    end

    it 'wraps negative y' do
      wrapped = Vector2d(0, -1).wrap(bound)
      expect(wrapped).to eq Vector2d(0, 9)
    end

    it 'wraps positive y past bound' do
      wrapped = Vector2d(0, 11).wrap(bound)
      expect(wrapped).to eq Vector2d(0, 1)
    end

    it 'is unchanged when within bound' do
      wrapped = Vector2d(5, 5).wrap(bound)
      expect(wrapped).to eq Vector2d(5, 5)
    end
  end
end

require 'battle'

describe Battle::Arena do
  describe 'update' do
    it 'calls update on all ships' do
      arena = Battle::Arena.new
      ship = double('Ship')
      # these stubs seem to indicate that perhaps wrapping should be handled by the ship
      # this could also let us remove Ship#position
      ship.stub position: Vector2d(0,0)
      ship.stub :position=
      ship.should_receive(:update)
      arena.ships.push ship
      arena.update
    end

    it 'wraps ship positions' do
      arena = Battle::Arena.new size: Vector2d(100, 100)
      ship = Battle::Ship.new position: Vector2d(-5, -5)
      arena.ships.push ship
      arena.update
      expect(ship.position).to eq Vector2d(95, 95)
    end
  end
end

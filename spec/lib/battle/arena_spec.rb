require 'battle'

describe Battle::Arena do
  describe 'update' do
    it 'calls update on all ships' do
      arena = Battle::Arena.new
      ship = double('Ship')
      ship.should_receive(:update)
      arena.ships.push ship
      arena.update
    end
  end
end

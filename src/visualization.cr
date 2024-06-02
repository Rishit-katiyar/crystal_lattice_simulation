require "crsfml"

class Visualization
  def initialize(lattice : Lattice)
    @lattice = lattice
    @window = SF::RenderWindow.new(SF::VideoMode.new(800, 600), "Crystal Lattice Simulation")
    @window.framerate_limit = 60
  end

  def run
    while @window.open?
      handle_events
      draw_lattice
      @window.display
    end
  end

  private def handle_events
    while event = @window.poll_event
      case event
      when SF::Event::Closed
        @window.close
      end
    end
  end

  private def draw_lattice
    @window.clear(SF::Color::Black)
    @lattice.atoms.each do |atom|
      circle = SF::CircleShape.new(2)
      circle.fill_color = SF::Color::White
      circle.position = SF::Vector2f.new(atom.x * 20, atom.y * 20)
      @window.draw(circle)
    end
  end
end

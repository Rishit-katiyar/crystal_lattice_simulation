require "./lattice"
require "./visualization"

def main
  lattice = Lattice.new(10, 10, 10)
  lattice.calculate_forces
  lattice.apply_thermal_motion(300.0)

  visualization = Visualization.new(lattice)
  spawn do
    loop do
      lattice.verlet_integration(0.01)
      sleep 0.01
    end
  end

  visualization.run
end

main

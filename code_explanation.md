# Detailed Script

#### **Lattice Initialization**
- Define the 3D lattice structure with atoms at specific positions.
- Initialize each atom with zero initial velocity and force.

```crystal
class Lattice
  property atoms : Array(Atom)

  def initialize(size_x : Int32, size_y : Int32, size_z : Int32)
    @atoms = Array(Atom).new
    (0...size_x).each do |i|
      (0...size_y).each do |j|
        (0...size_z).each do |k|
          @atoms << Atom.new(x: i.to_f, y: j.to_f, z: k.to_f)
        end
      end
    end
  end
end
```

#### **Interatomic Potentials and Force Calculation**
- Calculate the forces between each pair of atoms using the Lennard-Jones potential derivative.
- Update forces on each atom based on their relative positions.

```crystal
def lennard_jones_potential_derivative(r : Float64) : Float64
  epsilon = 1.0
  sigma = 1.0
  term1 = 12 * (sigma ** 12) / (r ** 13)
  term2 = 6 * (sigma ** 6) / (r ** 7)
  4 * epsilon * (term1 - term2)
end

def calculate_forces
  @atoms.each_with_index do |atom_i, i|
    @atoms.each_with_index do |atom_j, j|
      next if i == j

      dx = atom_j.x - atom_i.x
      dy = atom_j.y - atom_i.y
      dz = atom_j.z - atom_i.z
      r2 = dx*dx + dy*dy + dz*dz
      r = Math.sqrt(r2)

      f = lennard_jones_potential_derivative(r)
      atom_i.fx += f * dx / r
      atom_i.fy += f * dy / r
      atom_i.fz += f * dz / r
    end
  end
end
```

#### **Verlet Integration for Vibration Simulation**
- Update the positions of atoms using Verlet integration.
- Recalculate forces and update velocities accordingly.

```crystal
def verlet_integration(dt : Float64)
  @atoms.each do |atom|
    atom.x += atom.vx * dt + 0.5 * atom.fx * dt * dt
    atom.y += atom.vy * dt + 0.5 * atom.fy * dt * dt
    atom.z += atom.vz * dt + 0.5 * atom.fz * dt * dt

    atom.vx += 0.5 * atom.fx * dt
    atom.vy += 0.5 * atom.fy * dt
    atom.vz += 0.5 * atom.fz * dt
  end

  calculate_forces

  @atoms.each do |atom|
    atom.vx += 0.5 * atom.fx * dt
    atom.vy += 0.5 * atom.fy * dt
    atom.vz += 0.5 * atom.fz * dt
  end
end
```

#### **Thermal Motion Implementation**
- Apply random velocities to atoms based on the specified temperature.

```crystal
def apply_thermal_motion(temperature : Float64)
  k_b = 1.38e-23  # Boltzmann constant
  @atoms.each do |atom|
    factor = Math.sqrt(k_b * temperature)
    atom.vx += factor * (2.0 * rand - 1.0)
    atom.vy += factor * (2.0 * rand - 1.0)
    atom.vz += factor * (2.0 * rand - 1.0)
  end
end
```

#### **Main Simulation Loop**
- Initialize the lattice.
- Apply thermal motion.
- Run the simulation using Verlet integration and visualize the results.

```crystal
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
```

### Conclusion
This simulation provides a practical application of several fundamental concepts in physics, such as crystal lattice structures, interatomic potentials, numerical integration for simulating motion, and the effects of temperature on atomic vibrations. The Crystal programming language, with its syntax akin to Ruby and performance comparable to C, allows for efficient and expressive implementation of these physical models. By experimenting with different lattice types, potential functions, and temperatures, you can explore a variety of physical behaviors in crystal lattices.

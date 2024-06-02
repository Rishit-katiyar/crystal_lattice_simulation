struct Atom
  x : Float64
  y : Float64
  z : Float64
  vx : Float64 = 0.0
  vy : Float64 = 0.0
  vz : Float64 = 0.0
  fx : Float64 = 0.0
  fy : Float64 = 0.0
  fz : Float64 = 0.0
end

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

  def lennard_jones_potential_derivative(r : Float64) : Float64
    epsilon = 1.0
    sigma = 1.0
    term1 = 12 * (sigma ** 12) / (r ** 13)
    term2 = 6 * (sigma ** 6) / (r ** 7)
    4 * epsilon * (term1 - term2)
  end

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

  def apply_thermal_motion(temperature : Float64)
    k_b = 1.38e-23  # Boltzmann constant
    @atoms.each do |atom|
      factor = Math.sqrt(k_b * temperature)
      atom.vx += factor * (2.0 * rand - 1.0)
      atom.vy += factor * (2.0 * rand - 1.0)
      atom.vz += factor * (2.0 * rand - 1.0)
    end
  end
end

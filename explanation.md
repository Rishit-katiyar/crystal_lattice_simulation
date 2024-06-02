# Physics Principles in Crystal Lattice Vibration Simulation

#### 1. Crystal Lattice Structure
A crystal lattice is a three-dimensional arrangement of atoms or molecules in a structured, repeating pattern. The type of lattice (e.g., simple cubic, body-centered cubic, face-centered cubic) determines how atoms are positioned relative to one another.

- **Atoms:** Represented by their positions `(x, y, z)` in space.
- **Lattice Types:** Defines the geometric arrangement of these atoms.

#### 2. Interatomic Potentials
Atoms in a crystal lattice interact with each other through forces that can be described using potential energy functions. One common potential is the Lennard-Jones potential, which models the interaction between a pair of neutral atoms or molecules.

- **Lennard-Jones Potential:**
<p align="center">
  <img src="https://github.com/Rishit-katiyar/crystal_lattice_simulation/assets/167756997/17f064ed-90c7-4077-83b0-26f4fa0281f2" alt="Simulation Screenshot">
</p>

- **Force Calculation:**
  The force \( F(r) \) between two atoms is the negative gradient of the potential:
<p align="center">
  <img src="https://github.com/Rishit-katiyar/crystal_lattice_simulation/assets/167756997/8ee545a8-d54f-4684-a69b-f9ebed8fae9a" alt="Screenshot">
</p>

#### 3. Vibration Simulation
The positions of atoms are updated over time to simulate vibrations using numerical integration methods. Verlet integration is a common choice due to its simplicity and stability.

- **Verlet Integration:**
<p align="center">
  <img src="https://github.com/Rishit-katiyar/crystal_lattice_simulation/assets/167756997/527d327f-6681-4ebe-b10b-b4dbad51e86e" alt="Screenshot">
</p>

#### 4. Thermal Motion
Thermal motion represents the random motion of atoms due to thermal energy, which increases with temperature. This can be modeled by assigning random velocities to atoms based on the temperature.

- **Equipartition Theorem:**
<p align="center">
  <img src="https://github.com/Rishit-katiyar/crystal_lattice_simulation/assets/167756997/1ce88d80-f99c-434d-806b-68dd9f320955" alt="Screenshot">
</p>


#### 5. Phonons and Temperature Effects
Phonons are quantized vibrations in a crystal lattice. They play a significant role in thermal conductivity and specific heat capacity. In this simulation, the thermal effects on lattice vibrations are included by adjusting the velocities of atoms based on temperature.

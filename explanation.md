# Crystal Lattice Vibration Simulation

## Physics Principles in Crystal Lattice Vibration Simulation

### 1. Crystal Lattice Structure
A crystal lattice is a three-dimensional arrangement of atoms or molecules in a structured, repeating pattern. The type of lattice (e.g., simple cubic, body-centered cubic, face-centered cubic) determines how atoms are positioned relative to one another.

- **Atoms:** Represented by their positions `(x, y, z)` in space.
- **Lattice Types:** Defines the geometric arrangement of these atoms.

### 2. Interatomic Potentials
Atoms in a crystal lattice interact with each other through forces that can be described using potential energy functions. One common potential is the Lennard-Jones potential, which models the interaction between a pair of neutral atoms or molecules.

- **Lennard-Jones Potential:**
  \[
  V(r) = 4\epsilon \left[ \left(\frac{\sigma}{r}\right)^{12} - \left(\frac{\sigma}{r}\right)^{6} \right]
  \]
  where:
  - \( r \) is the distance between two atoms.
  - \( \epsilon \) is the depth of the potential well.
  - \( \sigma \) is the distance at which the potential is zero.

- **Force Calculation:**
  The force \( F(r) \) between two atoms is the negative gradient of the potential:
  \[
  F(r) = -\frac{dV(r)}{dr} = 24\epsilon \left[ 2 \left(\frac{\sigma}{r}\right)^{12} - \left(\frac{\sigma}{r}\right)^{6} \right] \frac{1}{r}
  \]

### 3. Vibration Simulation
The positions of atoms are updated over time to simulate vibrations using numerical integration methods. Verlet integration is a common choice due to its simplicity and stability.

- **Verlet Integration:**
  \[
  \mathbf{r}(t + \Delta t) = 2\mathbf{r}(t) - \mathbf{r}(t - \Delta t) + \mathbf{a}(t) \Delta t^2
  \]
  where:
  - \( \mathbf{r}(t) \) is the position at time \( t \).
  - \( \mathbf{a}(t) \) is the acceleration (force/mass) at time \( t \).

### 4. Thermal Motion
Thermal motion represents the random motion of atoms due to thermal energy, which increases with temperature. This can be modeled by assigning random velocities to atoms based on the temperature.

- **Equipartition Theorem:**
  Each degree of freedom in a system at temperature \( T \) has an average kinetic energy of:
  \[
  \langle E_k \rangle = \frac{1}{2} k_B T
  \]
  where \( k_B \) is the Boltzmann constant.

### 5. Phonons and Temperature Effects
Phonons are quantized vibrations in a crystal lattice. They play a significant role in thermal conductivity and specific heat capacity. In this simulation, the thermal effects on lattice vibrations are included by adjusting the velocities of atoms based on temperature.

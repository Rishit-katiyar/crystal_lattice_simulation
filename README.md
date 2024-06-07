# Crystal Lattice Simulation 📊💎


Welcome to the **Crystal Lattice Simulation** project! This project simulates crystal lattice vibrations, including thermal motion and phonon dynamics, using the Crystal programming language and visualizes the results using CrSFML.

## Table of Contents 📚
1. [Introduction](#introduction)
2. [Features](#features)
3. [Physics of Crystal Lattice Vibrations](#physics-of-crystal-lattice-vibrations)
4. [Installation](#installation)
5. [Usage](#usage)
6. [Project Structure](#project-structure)
7. [Contributing](#contributing)
8. [License](#license)

## Introduction 🧑‍🔬

This project aims to provide a detailed simulation of atomic vibrations in a crystal lattice structure. It incorporates elements like thermal motion, phonon behavior, and the effects of temperature on the lattice. The results are visualized using CrSFML, a Crystal binding to the Simple and Fast Multimedia Library (SFML).

## Features ✨
- **Crystal Lattice Structure Initialization**
- **Interatomic Potentials Calculation**
- **Vibration Simulation using Verlet Integration**
- **Thermal Motion Application**
- **Phonon Dynamics Simulation**
- **Real-time Visualization with CrSFML**

## Physics of Crystal Lattice Vibrations 🔬

### Crystal Lattice Structure
In a crystalline solid, atoms are arranged in a highly ordered, repeating pattern known as a lattice. Each atom vibrates around its equilibrium position, and these vibrations are influenced by the interactions with neighboring atoms.

### Phonons
Phonons are quanta of lattice vibrations and play a crucial role in the thermal properties of materials. They are essentially collective excitations representing the quantized modes of vibrations occurring in the crystal lattice. Phonons can propagate through the lattice, carrying thermal energy.

### Thermal Motion
At any temperature above absolute zero, atoms in the lattice possess kinetic energy, leading to thermal motion. This random motion is a key factor in understanding the heat capacity and thermal conductivity of materials.

### Simulation Aspects
1. **Interatomic Potentials:** The forces between atoms are modeled using potential energy functions, such as the Lennard-Jones potential, which describes the interaction based on the distance between atoms.
2. **Numerical Integration:** The Verlet integration method is used to update the positions and velocities of atoms over time, providing an efficient way to simulate the dynamics of the system.
3. **Temperature Effects:** Thermal energy is incorporated into the simulation to model the effects of temperature on atomic motion. The kinetic energy of atoms is adjusted based on the temperature using principles from statistical mechanics.

By simulating these aspects, we can observe how atoms in a crystal lattice respond to thermal energy and interact with each other, providing insights into the material's physical properties.

## Installation 🛠️

Follow these steps to set up the project on your local machine:

### Prerequisites
- Crystal language: [Installation Guide](https://crystal-lang.org/install/)
- SFML library: [SFML Installation Guide](https://www.sfml-dev.org/tutorials/2.5/)

### Steps
1. **Clone the repository:**
   ```sh
   git clone https://github.com/your-username/crystal_lattice_simulation.git
   cd crystal_lattice_simulation
   ```

2. **Install dependencies:**
   Install Crystal shards:
   ```sh
   shards install
   ```

   Make sure you have SFML installed on your system. If not, you can install it using the following commands:
   - **macOS:**
     ```sh
     brew install sfml
     ```
   - **Ubuntu:**
     ```sh
     sudo apt-get install libsfml-dev
     ```
   - **Windows:**
     Follow the [official guide](https://www.sfml-dev.org/tutorials/2.5/start-vc.php) to install SFML.

## Usage 🚀

Run the simulation using the following command:
```sh
crystal run src/crystal_lattice_simulation.cr
```

### Configuration
You can modify the simulation parameters directly in the `src/crystal_lattice_simulation.cr` file, such as lattice size and temperature.

## Project Structure 🗂️

Here's an overview of the project structure:

```plaintext
crystal_lattice_simulation/
├── lib/                # Shards dependencies
├── src/                # Source files
│   ├── lattice.cr      # Lattice and Atom classes
│   ├── visualization.cr# Visualization using CrSFML
│   └── crystal_lattice_simulation.cr # Main simulation script
├── .gitignore          # Git ignore file
├── LICENSE             # License file (GNU GPLv3)
├── README.md           # This README file
└── shard.yml           # Shards configuration
```

## Contributing 🤝

We welcome contributions! If you would like to contribute, please fork the repository and use a feature branch. Pull requests are warmly welcome.

1. **Fork the repository**
2. **Create your feature branch** (`git checkout -b feature/AmazingFeature`)
3. **Commit your changes** (`git commit -m 'Add some AmazingFeature'`)
4. **Push to the branch** (`git push origin feature/AmazingFeature`)
5. **Open a Pull Request**

## License 📜

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.

---

Thank you for checking out this project! If you have any questions or suggestions, feel free to open an issue or contact the maintainer. Happy coding! 😊

# Gas Molecule Movement

This is a project to simulate the behavior of rigid gas in an isolated and adiabatic system.

We suppose the initial position is distributed arbitrarily and
the velocity is normal distributed with standard deviation $\sigma = \sqrt{3k_B/T}$,
which $k_B$ is the Boltzman's constant.
Molecules which collides with the boundaries will be reflected elastically.
The radius of molecules are neglected so there is no collision or interaction between molecules.

The final result is:

$$
\langle E \rangle \propto N , \delta E \propto \sqrt N
$$

Which N is the number of particles, $\langle E \rangle$ is the average energy and $\delta E$ is the energy fluctuation.

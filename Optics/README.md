# OpticaL Beat

The optical beat frequency principle involves the interference of two light waves with slightly different frequencies. 
When these waves overlap, their electric fields combine, 
creating a resultant wave whose intensity oscillates at a frequency equal to the difference between the two original frequencies. 
This oscillation, called the beat frequency, can be observed as a variation in brightness over time. 
It is widely used in applications such as measuring frequency differences, optical heterodyning, and laser stabilization.

## Equations:
Take two sinusodal waves:

$$
E_1 = A_1\exp \left[\mathrm i (\vec k_1 \cdot \vec r - \omega_1 t)\right]
$$
$$
E_2 = A_2\exp \left[\mathrm i (\vec k_2 \cdot \vec r - \omega_2 t)\right]
$$

The overlapped light field:

$$
E = A_1\exp \left[\mathrm i (\vec k_1 \cdot \vec r - \omega_1 t)\right] + A_2\exp \left[\mathrm i (\vec k_2 \cdot \vec r - \omega_2 t)\right]
$$

To get the light intensity, operate **conjugate**:

$$
I \propto E\cdot E^* = \frac{c\epsilon_0}{2} \left(A_1^2 + A_2^2 + A_1A_2\left(\mathrm e^{\mathrm i(\vec q\cdot r - \delta t)} + \text{c.c.}\right)\right)
$$

where c.c. represents the complex conjugation. $\vec q = \vec k_1 - \vec k_2, \quad \delta = \omega_1 - \omega_2$

The coupled terms introduced **optical beat**. The overlapped field will move at the direction of of $\vec q$ and frequency of $\delta$.
When the lights has exactlt the same frequency, the interfere pattern do not move.
